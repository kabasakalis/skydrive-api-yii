# SkyDrive API Wrapper For Yii Framework
 © 2013  [Spiros Kabasakalis](http://iws.kabasakalis.gr/)
  [The MIT License (MIT)]( http://opensource.org/licenses/MIT)
  
  ![SkyDrive_Yii](https://hau5uq.dm1.livefilestore.com/y1pJFBBsUCi84_ZHf3iDAQDq7oaIcAxuF4p8xX4BzOmXDmY6tYibWeSWIo-ZsKSOf0bnb8ttUMD28E44g4OqDqwmx4kLEyL7ARj/sd_yii.png?psid=1)
  
  
 
 A wrapper for basic REST API calls to Microsoft's SkyDrive.


## Setup.
- Copy SkyDriveAPI.php class file in protected/extensions/skydrive folder,(or location of your choice).
- Copy SkyDriveController.php file in protected/controllers folder.
- Include the [Http Client Library](http://www.yiiframework.com/extension/ehttpclient) by Antonio Ramirez.
  Copy  ehttpclient folder   in protected/extensions folder and make sure it is imported properly in   _construct  function of SkyDriveAPI class.
- Make sure that SkyDriveAPI class  is properly imported  in init function of SkyDriveController.
- Create a [Microsoft Account](http://windows.microsoft.com/en-US/windows-live/sign-in-what-is-microsoft-account),if you don't have one  already.
-  Go to [Live Connect Developer Center](http://msdn.microsoft.com/en-us/live/ff519582.aspx) and sign in with your Microsoft account  credentials.
- Select "My Apps" and create one.
- Get the API Settings for your app,namely Client ID,Client secret,and Redirect domain,and  fill in the default values for the following variables
   in SkyDriveAPI Class : $client_id ,$client_secret and $redirect_uri respectively.The Redirect Domain is the domain that hosts your site.

##[Authorization code grant flow](http://msdn.microsoft.com/en-us/library/live/hh243647.aspx)
 - We are implementing the Authorization code grant flow as defined in OAuth2 spec.We include wl.offline_access  scope,
      meaning the user is authorizing the app to interact even when he is offline.This scenario is suitable when you want data returned by
      the API  accessible in the frontend by site visitors who do not have a Microsoft account.To make this possible,you as an admin, go through
      the Authorization code grant flow only once.You sign in and authorize your app,and get a long lived(one year) refresh token,which
      you either hard code in your SkyDriveAPI class ( $refresh_token variable) or store in database.All API calls to SkyDrive require a valid access token.
      The refresh token is used to obtain  this short lived access token (one hour) which is stored in session.Every time the access token is unavailable
      in session or expires in the  next 30 seconds,  SkyDrive class calls the refreshToken function which renews the access token and stores it in session again.
      The refreshToken function also  returns a new refresh token,so you have the option to replace your stored refresh token
      with a new one,so this basically makes refresh token immortal,and in theory you will never have to undergo the authorization grant flow
      ever again and your web app can use the API without asking for any Microsoft credentials or authorization.
 - SkyDriverController automates the flow described above.You only have to navigate your browser to skydrive/getCode,and the API will return a refresh token,
    after you sign in with your Microsoft Account  credentials and authorize your application.Hard code this refresh token in SKyDriveAPI class ($refresh_token variable),
    or store it in database as already explained-in that case you will have to modify the controller so that it reads the refresh token from database.

    ## Usage
     There are commented examples of SkyDrive API calls in index action of SkyDriveController.Uncomment one every time and test.

    ##Credits
     [Http Client for Yii](http://www.yiiframework.com/extension/ehttpclient), a wrapper of Zend Http Client library,by Antonio Ramirez.

    ##Resources
 - [SKyDrive](https://skydrive.live.com/)
 - [SkyDrive API (Live Connect)](http://msdn.microsoft.com/en-us/library/live/hh826521.aspx)
 - [REST reference (Live Connect)](http://msdn.microsoft.com/en-us/library/live/hh243648.aspx)
 - [OAuth 2.0 (Live Connect)](http://msdn.microsoft.com/en-us/library/live/hh243647.aspx)
 - [Microsoft Account](http://windows.microsoft.com/en-US/windows-live/sign-in-what-is-microsoft-account)







