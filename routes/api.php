<?php

Route::group(['middleware' => ['request']] , function (){

//Admin && Manager Portal

    //Login === Admin/Manager/Customer
    Route::post('login', 'Api\V1\Admin\UsersApiController@login');

    //Control Page
    Route::post('register', 'Api\V1\Admin\UsersApiController@register');
    Route::post('getUser', 'Api\V1\Admin\UsersApiController@getUsers');
    Route::post('edit_user', 'Api\V1\Admin\UsersApiController@edit_user');
    Route::post('delete_user', 'Api\V1\Admin\UsersApiController@delete');

    //Customer Page
    Route::post('getCustomer', 'Api\V1\Admin\UsersApiController@getCustomers');
    Route::post('customer_edit', 'Api\V1\Admin\CustomerApiController@customer_edit');
    Route::post('upload', 'Api\V1\Admin\CustomerApiController@upload');
    Route::post('custom_delete', 'Api\V1\Admin\CustomerApiController@custom_delete');

    //Property Page
    Route::post('getProperty', 'Api\V1\Admin\UsersApiController@getProperties');
    Route::post('editProperty', 'Api\V1\Admin\UsersApiController@editProperties');
    Route::post('updateProperty', 'Api\V1\Admin\CustomerApiController@updateProperties');
    Route::post('custom_register', 'Api\V1\Admin\CustomerApiController@custom_register');
    Route::post('get_owner', 'Api\V1\Admin\CustomerApiController@get_owner');
    Route::post('customer_property', 'Api\V1\Admin\CustomerApiController@customer_property');
    Route::post('property_upload', 'Api\V1\Admin\CustomerApiController@property_upload');
    Route::post('property_delete', 'Api\V1\Admin\CustomerApiController@property_delete');


//Customer Portal

    // Customer Basic Info
    Route::post('getBasicUser', 'Api\V1\Admin\CustomerApiController@getBasicUser');

    // Customer Property Info
    Route::post('getCustomerProperty', 'Api\V1\Admin\CustomerApiController@getCustomerProperty');

    // Customer Legal Info
    Route::post('getLegalInfo', 'Api\V1\Admin\CustomerApiController@getLegalInfo');
    Route::post('getCustomerLegalInfo', 'Api\V1\Admin\CustomerApiController@getCustomerLegalInfo');


});

//FileDownLoad

Route::group(['middleware' => ['response']], function () {

    // Basic Customer File DownLoad
    Route::post('basic_info_download', 'Api\V1\Admin\CustomerApiController@basic_info_download');

    //Basic Legal File DownLoad
    Route::post('legal_FileDownload', 'Api\V1\Admin\CustomerApiController@legal_FileDownload');
    Route::post('legal_fileupload', 'Api\V1\Admin\CustomerApiController@legal_fileupload');

});


Route::group(['prefix' => 'v1', 'as' => 'api.', 'namespace' => 'Api\V1\Admin', 'middleware' => ['auth:api']], function () {
    // Permissions
    Route::apiResource('permissions', 'PermissionsApiController');

    // Roles
    Route::apiResource('roles', 'RolesApiController');

    // Users
    Route::apiResource('users', 'UsersApiController');

    // Statuses
    Route::apiResource('statuses', 'StatusesApiController');

    // Priorities
    Route::apiResource('priorities', 'PrioritiesApiController');

    // Categories
    Route::apiResource('categories', 'CategoriesApiController');

    // Tickets
    Route::post('tickets/media', 'TicketsApiController@storeMedia')->name('tickets.storeMedia');
    Route::apiResource('tickets', 'TicketsApiController');

    // Comments
    Route::apiResource('comments', 'CommentsApiController');
});
