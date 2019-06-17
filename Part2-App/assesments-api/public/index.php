<?php

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;

if (PHP_SAPI == 'cli-server') {
	// To help the built-in PHP dev server, check if the request was actually for
	// something which should probably be served as a static file
	$url  = parse_url($_SERVER['REQUEST_URI']);
	$file = __DIR__ . $url['path'];
	if (is_file($file)) {
		return false;
	}
}

require __DIR__ . '/../vendor/autoload.php';

session_start();

// Instantiate the app
$settings = require __DIR__ . '/../src/settings.php';
$app = new \Slim\App($settings);

// Set up dependencies
$dependencies = require __DIR__ . '/../src/dependencies.php';
$dependencies($app);

// Register middleware
$middleware = require __DIR__ . '/../src/middleware.php';
$middleware($app);

$app->get('/questions', function (Request $request, Response $response, array $args) {
	$servername = "localhost";
	$database = "assesments";
	$username = "slim";
	$password = "tWSagQij8FykIR5I";
	
	// Create connection
	$conn = new mysqli($servername, $username, $password, $database);
	if ($conn->connect_errno) {
		echo "Failed to connect to MySQL: (" . $conn->connect_errno . ") " . $conn->connect_error;
	}
	else{
		$conn->set_charset('utf8');
	}
	

	$question = [];

	$res = $conn->query("SELECT questions.questionId, questions.questionText, interest_area.intAreaId, interest_area.Interest_Area_Name FROM questions JOIN interest_area ON questions.intAreaId = interest_area.intAreaId ORDER BY questions.intAreaId,questions.questionId");

	$res->data_seek(0);
	while ($row = $res->fetch_assoc()) {
		array_push($question,$row);
	}

	$conn->close();
	$response->getBody()->write(json_encode($question));

	return $response
	->withHeader('Access-Control-Allow-Origin', '*')
	->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
	->withHeader('Access-Control-Allow-Methods', 'GET');
});

$app->get('/auth/{username}/{password}', function (Request $request, Response $response, array $args) {
	$servername = "localhost";
	$database = "assesments";
	$username = "slim";
	$password = "tWSagQij8FykIR5I";
	
	// Create connection
	$conn = new mysqli($servername, $username, $password, $database);
	if ($conn->connect_errno) {
		echo "Failed to connect to MySQL: (" . $conn->connect_errno . ") " . $conn->connect_error;
	}
	else{
		$conn->set_charset('utf8');
	}

	$stmt = $conn->prepare("SELECT ID FROM users where user_name = ? and password = ?");
	$stmt->bind_param("ss",$args['username'],$args['password']);
	$stmt->execute();

	$res = $stmt->get_result();

	if($res->num_rows === 0){
		$sess['sessionID'] = null;
	}
	else{
		$data = $res->fetch_assoc();
		$user = $data['ID'];

		$md5Input = time() . $user;
		$sess['sessionID'] = md5($md5Input);

		// add new session ID
		$stmt = $conn->prepare("INSERT INTO `user_sessions` (UserID, SessionID) VALUES (?, ?)");
		$stmt->bind_param("is",$user, $sess['sessionID']);
		$stmt->execute();

	}

	$response->getBody()->write(json_encode($sess['sessionID']));
	return $response
	->withHeader('Access-Control-Allow-Origin', '*')
	->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
	->withHeader('Access-Control-Allow-Methods', 'GET');
});

$app->get('/score/{session}', function (Request $request, Response $response, array $args){
	$servername = "localhost";
	$database = "assesments";
	$username = "slim";
	$password = "tWSagQij8FykIR5I";
	
	// Create connection
	$conn = new mysqli($servername, $username, $password, $database);
	if ($conn->connect_errno) {
		echo "Failed to connect to MySQL: (" . $conn->connect_errno . ") " . $conn->connect_error;
	}
	else{
		$conn->set_charset('utf8');
	}

	$stmt = $conn->prepare("SELECT UserID FROM `user_sessions` where SessionID = ?");
	$stmt->bind_param("s",$args['session']);
	$stmt->execute();

	if($conn->error) array_push($sql_err,$conn->error);

	$res = $stmt->get_result();
	$data = $res->fetch_assoc();
	$userID = $data['UserID'];

	$returnData = [];
	$stmt = $conn->prepare("SELECT answers.Score,questions.questionText,interest_area.Interest_Area_Name FROM `answers` join questions on answers.quesitonID = questions.questionId join interest_area on questions.intAreaId = interest_area.intAreaId WHERE answers.UserID = ? ORDER BY questions.intAreaId,questions.questionId");
	$stmt->bind_param("i",$userID);
	$stmt->execute();

	$res = $stmt->get_result();

	while($row = $res->fetch_assoc()) {
		array_push($returnData,$row);
	}

	$response->getBody()->write(json_encode($returnData));
	return $response
	->withHeader('Access-Control-Allow-Origin', '*')
	->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
	->withHeader('Access-Control-Allow-Methods', 'GET');
});

$app->post('/update', function (Request $request, Response $response, array $args) {
	$servername = "localhost";
	$database = "assesments";
	$username = "slim";
	$password = "tWSagQij8FykIR5I";
	
	// Create connection
	$conn = new mysqli($servername, $username, $password, $database);
	if ($conn->connect_errno) {
		echo "Failed to connect to MySQL: (" . $conn->connect_errno . ") " . $conn->connect_error;
	}
	else{
		$conn->set_charset('utf8');
	}

	$sessionID = $request->getParsedBody()['Assessment_Session_ID'];
	$scores = $request->getParsedBody()['Score_Data'];


	$sql_err = [];

	// TODO:
		// grab the UserID associated with the session
		// empty data in sql table
		// build list of rows
		// insert each row into table

		$stmt = $conn->prepare("SELECT UserID FROM `user_sessions` where SessionID = ?");
		$stmt->bind_param("s",$sessionID);
		$stmt->execute();

		if($conn->error) array_push($sql_err,$conn->error);

		$res = $stmt->get_result();
		$data = $res->fetch_assoc();
		$userID = $data['UserID'];

		$stmt = $conn->prepare("DELETE FROM `answers` WHERE UserID = ?");
		$stmt->bind_param("i",$userID);
		$stmt->execute();

		if($conn->error) array_push($sql_err,$conn->error);

		$data['answersdelnum'] = $stmt->affected_rows;

		foreach($scores as $scoreData){
			$questionID = $scoreData['ID'];
			$scoreVal = $scoreData['Score'];

			$stmt = $conn->prepare("INSERT INTO `answers` (quesitonID, Score, UserID) VALUES (?, ?, ?)");
			$stmt->bind_param("iii",$questionID, $scoreVal, $userID);
			$stmt->execute();
			$stmt->close();

			if($conn->error) array_push($sql_err,$conn->error);
		}
		
		$returnData = [];
		if(count($sql_err) == 0){
			$stmt = $conn->prepare("SELECT answers.Score,questions.questionText,interest_area.Interest_Area_Name FROM `answers` join questions on answers.quesitonID = questions.questionId join interest_area on questions.intAreaId = interest_area.intAreaId WHERE answers.UserID = ? ORDER BY questions.intAreaId,questions.questionId");
			$stmt->bind_param("i",$userID);
			$stmt->execute();

			$res = $stmt->get_result();

			while($row = $res->fetch_assoc()) {
				array_push($returnData,$row);
			}

			$stmt->close();
			if($conn->error) array_push($sql_err,$conn->error);
		}

		$data['sql_err'] = $sql_err;
		$data['returnData'] = $returnData;
		$response->getBody()->write(json_encode($returnData));
		return $response
		->withHeader('Access-Control-Allow-Origin', '*')
		->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
		->withHeader('Access-Control-Allow-Methods', 'GET');
});

// Run app
$app->run();
