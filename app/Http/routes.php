<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/home', function () {
    return view('welcome');
});

Route::get('/', 'DashboardController@getIndex');

//Dependent List Box
Route::group(array('prefix'=>'list-box'), function(){
    // Ajax Get Local Governments Based on the state
    Route::get('/lga/{id}', 'ListBoxController@lga');
    // Ajax Get Senatorial Districts Based on the state
    Route::get('/districts/{id}', 'ListBoxController@district');
    // Ajax Get Federal Constituencies Based on the state
    Route::get('/federal-const/{id}', 'ListBoxController@federal_reps');
    // Ajax Get State Constituencies Based on the state
    Route::get('/state-const/{id}', 'ListBoxController@state_reps');
});

Route::controllers([
    'auth' => 'Auth\AuthController',
    'password' => 'Auth\PasswordController',
    'users' => 'UserController',
    //MasterRecords
    'menus' => 'MasterRecords\MenusController',
    'menu-items' => 'MasterRecords\MenuItemsController',
    'sub-menu-items' => 'MasterRecords\SubMenuItemController',
    'user-types' => 'MasterRecords\UserTypeController',
    'ranks' => 'MasterRecords\RankController',
    'houses' => 'MasterRecords\HouseController',
    'sectors' => 'MasterRecords\SectorController',
    //Legislators
    'senators' => 'SenatorsController',
    'federal-reps' => 'FederalRepresentativesController',
    'state-reps' => 'StateRepresentativesController',
    'hansards' =>'HansardsController',
    'vote-proceedings' =>'VotesAndProceedingsController',
    //////
    'profiles' => 'ProfilesController',
    'supervisors' => 'SupervisorsController',
    'dashboard' =>'DashboardController',
]);

//Users Route
Route::resource('users','UserController');
Route::get('users/password-change', 'UserController@getChange');
Route::post('users/password-change', 'UserController@postChange');

//Projects Route
Route::resource('projects', 'Projects\ProjectsController');
Route::group(array('prefix'=>'projects'), function(){
    Route::get('/archive/{id}', 'Projects\ProjectsController@archive');
    Route::get('/publishn /{id}/{publish_id}', 'Projects\ProjectsController@publish');
    Route::get('/contractor/{id}', 'Projects\ProjectsController@contractor');
    //Domain
    Route::get('/domain/{id}', 'Projects\ProjectsController@domain');
    Route::post('/domain/{id}', 'Projects\ProjectsController@saveDomain');
    Route::get('/domain/delete/{id}/{project_id}', 'Projects\ProjectsController@deleteDomain');
    //Beneficiary
    Route::get('/beneficiary/{id}', 'Projects\ProjectsController@beneficiary');
    Route::post('/beneficiary/{id}', 'Projects\ProjectsController@saveBeneficiary');
    Route::get('/beneficiary/delete/{id}/{project_id}', 'Projects\ProjectsController@deleteBeneficiary');
});

//Timeline / Project Updates
Route::group(array('prefix'=>'projects/timeline'), function(){
    Route::get('/{id}', 'Projects\ProjectUpdatesController@index');
    Route::post('/', 'Projects\ProjectUpdatesController@updateThread');
    Route::post('/comment', 'Projects\ProjectUpdatesController@comment');
});

//Contractors
Route::resource('contractors','Projects\ContractorsController');
Route::get('contractors/delete/{id}', 'Projects\ContractorsController@destroy');
Route::get('contractors/projects/{id}', 'Projects\ContractorsController@projects');


Route::group(array('prefix'=>'api'), function(){
    Route::post('/project/comment/', 'ApiController@projectComment');
    Route::post('/project/gestures/', 'ApiController@projectGestures');

    Route::get('/assembly/{id}', 'ApiController@getAssembly');
});