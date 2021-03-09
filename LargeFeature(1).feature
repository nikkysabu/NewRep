@Regression
Feature: Verify Onboarding and Registration
  User Stories Covered - VOA-64, VOA-69, VOA-70, VOA-71, VOA-72, VOA-162, VOA-135, VOA-116, VOA-100, VOA-109, VOA-129, VOA-161
  Task - VOA-841
  PDS - PDS-PROTOCOLS-02530

  @Onboarding_Registration_forgot-password_NoAccessCode_MultipleUserLogin @OnboardingAndRegistration
  Scenario: Verification of Welcome Screen
    Given I should see "welcome_screen_txt" screen
    Then  I verify text of "welcome_screen_txt" as "onboarding.component.welcome.text.title" text
    Then  I verify text of "welcome_screen_subtxt1" as "onboarding.component.welcome.text.description" text
    Then  I verify text of "welcome_screen_subtxt2" as "onboarding.component.welcome.text.caution" text
    When  I kill app
    And I relaunch app to verify user views Welcome Screen
    Then I should see "welcome_screen_continue_btn" button
    And I verify text of "welcome_screen_continue_btn" as "onboarding.component.welcome.text.btnContinue"
    When I tap androidBackNative button
    Then  I verify app in "background"  state
    When I relaunch app
    Then I should see "welcome_screen_txt" text
    When I tap "welcome_screen_continue_btn" button

  @Onboarding_Registration_forgot-password_NoAccessCode_MultipleUserLogin @OnboardingAndRegistration
  Scenario: Verify Login and Registration Screens
    And I should see "login_btn" button
    And I should see "register_btn" button
    When I tap androidBackNative button
    Then I verify app in "background"  state
    Given I relaunch app
    And I should see "login_btn" button
    And I should see "register_btn" button
    And I verify text of "login_btn" as "signUp.text.btnLogIn"
    And I verify text of "register_btn" as "signUp.text.btnRegister"

  @Onboarding_Registration_forgot-password_NoAccessCode_MultipleUserLogin @OnboardingAndRegistration
  Scenario: Verify Terms and Privacy Screen, Agree and Disagree Buttons
    Then I tap "register_btn" button
    And I verify text of "termPrivacy_screen_header" as "legal.text.lblHeader"
    And I verify text of "termPrivacy_screen_subtxt" as "TermsAndPrivacy_Screen_Subtext"
    Then I should see "termPrivacy_screen_agree_btn" button
    Then I should see "termPrivacy_screen_disagree_btn" button
    And I verify text of "termPrivacy_screen_agree_btn" as "legal.text.btnAgree"
    And I verify text of "termPrivacy_screen_disagree_btn" as "legal.text.btnDisagree"
    Then I tap "termPrivacy_screen_disagree_btn" button
    And I should see "login_btn" button
    And I should see "register_btn" button
    When I tap "register_btn" button
    Then I should see "termPrivacy_screen_header" header
    When I kill app
    Then I relaunch app
    Then I should see "login_btn" button
    When I tap "register_btn" button
    Then I should see "termPrivacy_screen_header" header
    Then I tap "termPrivacy_screen_agree_btn" button
    Then I should see "userRegistration_screen_header_txt" header
    When I tap androidBackNative button
    Then I should see "termPrivacy_screen_header" header
    And I should see "termPrivacy_screen_subtxt" text

  @Onboarding_Registration_forgot-password_NoAccessCode_MultipleUserLogin @OnboardingAndRegistration
  Scenario: Verify user navigation to Terms and Conditions Screen
    When I tap on "TermOfUse" link
    Then I should see "termOfUse_screen_header" header
    And I should see "termOfUse_screen_details_content" text
    And I should see "navigate_back_btn" button
    And  I should see "termOfUse_screen_header" header
    And I should see "termOfUse_screen_details_content" text
    Then I swipe screen "down"
    And I swipe screen "down"
    Then I should see "termOfUse_screen_header" header
    Then I tap "navigate_back_btn" button
    Then I should see "termPrivacy_screen_header" header

  @Onboarding_Registration_forgot-password_NoAccessCode_MultipleUserLogin @OnboardingAndRegistration
  Scenario: Verify user navigation to Privacy Statement Screen
    When I tap on "PrivacyStatement" link
    And I should see "privacyStatement_screen_header" header
    And I should see "privacyStatement_screen_details_content" text
    And  I should see "navigate_back_btn" button
    Then I swipe screen "down"
    And I swipe screen "down"
    Then I should see "privacyStatement_screen_header" header
    Then I tap "navigate_back_btn" button
    Then I should see "termPrivacy_screen_header" header

  @Onboarding_Registration_forgot-password_NoAccessCode_MultipleUserLogin @OnboardingAndRegistration
  Scenario: Verify Registration Screen, buttons and text fields
    When I tap "termPrivacy_screen_agree_btn" button
    Then I verify text of "userRegistration_firstName_textbox" as "signUp.component.userDetails.0.text.placeholder" text
    Then I verify text of "userRegistration_lastName_textbox" as "signUp.component.userDetails.1.text.placeholder" text
    Then I verify text of "userRegistration_dob_textbox" as "signUp.component.userDetails.3.text.placeholder" text
    Then I verify text of "userRegistration_email_textbox" as "signUp.component.userDetails.2.text.placeholder" text
    Then I should see "userRegistration_firstName_textbox" label
    When I type "validFirstName" in "userRegistration_firstName_textbox" field
    And I type "validLastName" in "userRegistration_lastName_textbox" field
    And I type "primaryEmailAddress" in "userRegistration_email_textbox" field
    When I tap "userRegistration_dob_textbox" field
    And I tap "userRegistration_dob_okbutton" button
    Then "userRegistration_continue_btn" should be enabled
    Then I verify text of "userRegistration_continue_btn" as "signUp.text.btnContinue"
    When I tap "userRegistration_continue_btn" button

  @Onboarding_Registration_forgot-password_NoAccessCode_MultipleUserLogin @OnboardingAndRegistration
  Scenario: Verify Password Setup Screen, buttons and text fields, error messages, place holder texts
    Then I should see "password_setup" screen
    Then I should see "navigate_back_btn" icon
    Then I verify text of "password_setup" as "signUp.text.lblPasswordHeader" text
    Then I should see "password_edittext" field
    Then I verify text of "password_edittext" as "signUp.component.password.0.text.placeholder" header
    Then I should see "passwordSetupShowPasswordIcon" icon
    Then I should see "confirm_password_edittext" field
    Then I verify text of "confirm_password_edittext" as "signUp.component.password.1.text.placeholder" header
    Then I should see "passwordSetupShowConfirmPasswordIcon" icon
    Then I verify text of "password_helpertext" as "signUp.component.password.1.message" text
    Then I should see "password_saveBtn" button
    Then "password_saveBtn" should be disabled
    Then "confirm_password_edittext" should be disabled
    When I type "validPassword" in "password_edittext" field
    Then "confirm_password_edittext" should be enabled
    When I type "invalidPassword" in "password_edittext" field
    Then I tap "password_setup" field to verify Password field validation error message
    Then I verify text of "password_errorMsg" as "signUp.component.password.0.text.error" text
    When I type "invalidPassword" in "password_edittext" field
    Then I should not see "password_errorMsg" error
    When I type "validPassword" in "password_edittext" field
    When I type "invalidPassword" in "confirm_password_edittext" field
    Then I tap "password_setup" field to verify Confirm Password field validation error message
    Then I verify text of "password_errorMsg" as "signUp.component.password.1.text.error" text
    And I should not see "password_helpertext" message
    When I type "validPassword" in "confirm_password_edittext" field
    Then I should not see "password_errorMsg" error
    When I tap "passwordSetupShowPasswordIcon" icon
    And  I type "password" in "password_edittext" field
    Then I verify input text "password" in "password_edittext" field
    When I tap "passwordSetupShowConfirmPasswordIcon" icon
    And  I type "password" in "confirm_password_edittext" field
    Then I verify input text "password" in "confirm_password_edittext" field
    When I tap "password_saveBtn" button
    Then "password_saveBtn" should be enabled
    Then I verify text of "password_saveBtn" as "signUp.text.btnSavePassword"
    When I tap "password_saveBtn" button

  @Onboarding_Registration_forgot-password_NoAccessCode_MultipleUserLogin @OnboardingAndRegistration
  Scenario: Verify Vega Access Code Screen and functionality of No Access Code Flow
    Then I tap "biometrics_noThanks_btn" button denying the biometric alert
    Then I should see "vegaAccessCodeHeader" screen
    Then I verify text of "noAccessCode_btn" as "registrationCode.component.entry.text.btnRegistrationCode" text
    Then I verify text of "finishSigningUp_btn" as "registrationCode.component.entry.text.btnSubmit" text
    And I tap "noAccessCode_btn" button
    Given I should see "noAccessCode_title" title
    Then I verify text of "noAccessCode_subtitle" as "registrationCode.component.help.text.lblTitle" text
    Then I verify text of "noAccessCode_title" as "registrationCode.component.help.text.lblSubTitle" text
    And  I should see "noAccessCode_agreeRadioBtn" button
    Then I verify text of "noAccessCode_agreeRadioBtn" as "registrationCode.component.help.text.lblAgreetOption" text
    And  I should see "noAccessCode_disagreeRadioBtn" button
    Then I verify text of "noAccessCode_disagreeRadioBtn" as "registrationCode.component.help.text.lblDisagreeOption" text
    And  "noAccessCode_continueBtn" should be disabled
    Given I tap "noAccessCode_disagreeRadioBtn" button
    Then  "noAccessCode_continueBtn" should be enabled
    And I tap "noAccessCode_continueBtn" button
    Then I should see "noAccessCode_title" title
    Then I verify text of "noAccessCode_subtitle" as "registrationCode.component.help.text.lblThankYou" text
    Then I verify text of "noAccessCode_title" as "registrationCode.component.help.text.lblDeleteMessage" text
    And I should see "noAccessCode_disagreeCloseBtn" button
    When I tap "noAccessCode_disagreeCloseBtn" button
    Then I should see "login_btn" button

  @Onboarding_Registration_forgot-password_NoAccessCode_MultipleUserLogin @OnboardingAndRegistration
  Scenario: Verify Yes, let me know option and close button
    When I tap "register_btn" button
    When I tap "termPrivacy_screen_agree_btn" button
    When I type "validFirstName" in "userRegistration_firstName_textbox" field
    And I type "validLastName" in "userRegistration_lastName_textbox" field
    And I type "secondaryEmailAddress" in "userRegistration_email_textbox" field
    When I tap "userRegistration_dob_textbox" field
    And I tap "userRegistration_dob_okbutton" button
    Then "userRegistration_continue_btn" should be enabled
    Then I verify text of "userRegistration_continue_btn" as "signUp.text.btnContinue"
    When I tap "userRegistration_continue_btn" button
    Then I should see "password_setup" screen
    When I type "password" in "password_edittext" field
    And I type "password" in "confirm_password_edittext" field
    And I tap "password_saveBtn" button
    And I tap "password_saveBtn" button
    Then I tap "biometrics_noThanks_btn" button
    When I tap "login_alert_ok_btn" button
    Then I should see "vegaAccessCodeHeader" screen
    When I tap "noAccessCode_btn" button
    Given I tap "noAccessCode_agreeRadioBtn" button
    Then  "noAccessCode_continueBtn" should be enabled
    And I tap "noAccessCode_continueBtn" button
    Then I should see "noAccessCode_title" title
    Then  I verify text of "noAccessCode_subtitle" as "registrationCode.component.help.text.lblThankYouInterest" text
    Then  I verify text of "noAccessCode_title" as "registrationCode.component.help.text.lblContactMessage" text
    And  I should see "noAccessCode_agreeCloseBtn" button
    When  I tap "noAccessCode_agreeCloseBtn" button
    Then  I should see "login_btn" button

  @Onboarding_Registration_forgot-password_NoAccessCode_MultipleUserLogin @OnboardingAndRegistration
  Scenario: Verify Forgot Password
    Then I tap "login_forgotPassword_link" link
    Then I verify text of "forgotPasswordHeader" as "forgotPassword.text.lblHeader"
    And I verify text of "forgotPasswordSubText" as "forgotPassword.text.lblSubHeader"
    And I verify text of "forgotPasswordEmailEditbox" as "forgotPassword.forgotPasswordTextField.0.text.placeholder"
    And I verify text of "forgotPasswordResetPasswordButton" as "forgotPassword.text.btnNext"
    And I should see "navigate_back_btn" button
    And "forgotPasswordResetPasswordButton" should be disabled

  @Onboarding_Registration_forgot-password_NoAccessCode_MultipleUserLogin @OnboardingAndRegistration
  Scenario: Verify email in Forgot Password page by valid/invalid email
    When I type "invalidEmailForgotPassword" in "forgotPasswordEmailEditbox" field
    And I tap "forgotPasswordResetPasswordButton" button
    Then I should see "forgotPasswordErrorMessage" text
    And I verify text of "forgotPasswordErrorMessage" as "forgotPassword.forgotPasswordTextField.0.text.error"
    When I type "validEmailForgotPassword" in "forgotPasswordEmailEditbox" field
    And I should not see "forgotPasswordErrorMessage" text
    Then "forgotPasswordResetPasswordButton" should be enabled
    Then I tap "forgotPasswordResetPasswordButton" button

  @Onboarding_Registration_forgot-password_NoAccessCode_MultipleUserLogin @OnboardingAndRegistration
  Scenario: Verify Reset Password Confirmation page
    And I should see "forgotPasswordContinueButton" button
    Then I verify text of "forgotPasswordscreen_success_title1" as "ForgotPasswordscreen_successHeader"
    Then I verify text of "forgotPasswordscreen_success_title2" as "ForgotPasswordscreen_successsubHeader"
    And I should see "forgotPasswordContinueButton" button
    And I tap "forgotPasswordContinueButton" button
    Then I should see "login_forgotPassword_link" button

  @Onboarding_Registration_forgot-password_NoAccessCode_MultipleUserLogin @OnboardingAndRegistration
  Scenario: Verify the reset-password email in the browser
    Then I fetch the Reset Password Url of "validEmailForgotPassword" and launch the url in the browser
    And I relaunch app
    Then I should see "login_btn" button
    And I tap "login_btn" button

  @Onboarding_Registration_forgot-password_NoAccessCode_MultipleUserLogin @OnboardingAndRegistration
  Scenario: Verify Multiple User Alert Message
    When I type "loginEmailUser1" in "login_email_textbox" field
    And I type "loginPassword" in "login_password_textbox" field
    Then I tap "login_btn" button
    Then I verify text of "alert_message_text" as "primaryDeviceManagement.alert.primaryDeviceAlert.message"
    When I tap "login_alert_yes_btn" button
    And I verify text of "alert_message_text" as "biometric.alert.permission.message"
    And I verify text of "biometrics_noThanks_btn" as "biometric.alert.permission.btnSecondary"
    And I verify text of "biometrics_enableBiometrics_btn" as "biometric.alert.permission.btnPrimary"
    Then I tap "biometrics_noThanks_btn" button
    Then I verify text of "alert_message_text" as "primaryDeviceManagement.alert.multipleUserAlert.message"
    When I tap "login_alert_cancel_btn" button
    Then  I should see "login_btn" button

  @Onboarding_Registration_forgot-password_NoAccessCode_MultipleUserLogin @OnboardingAndRegistration
  Scenario: Verify Multiple User Alert Message
    When I type "loginEmailUser1" in "login_email_textbox" field
    And I type "loginPassword" in "login_password_textbox" field
    Then I tap "login_btn" button
    Then I verify text of "alert_message_text" as "primaryDeviceManagement.alert.primaryDeviceAlert.message"
    When I tap "login_alert_yes_btn" button
    And I verify text of "alert_message_text" as "biometric.alert.permission.message"
    And I verify text of "biometrics_noThanks_btn" as "biometric.alert.permission.btnSecondary"
    And I verify text of "biometrics_enableBiometrics_btn" as "biometric.alert.permission.btnPrimary"
    Then I tap "biometrics_noThanks_btn" button
    Then I verify text of "alert_message_text" as "primaryDeviceManagement.alert.multipleUserAlert.message"
    When I tap "login_alert_ok_btn" button
    Then I tap "allowDeviceLocation_DialogBoxAllowAlwaysBtn" option
    Then I should see "today_screen" screen

  @HCP_Code_Validation @OnboardingAndRegistration
  Scenario: User Registration with valid details
    Given I reset the Application's memory to clear cache
    When I tap "welcome_screen_continue_btn" button
    And I tap "register_btn" button
    And I tap "termPrivacy_screen_agree_btn" button
    And I type "firstName" in "userRegistration_firstName_textbox" field
    And I type "validLastName" in "userRegistration_lastName_textbox" field
    And I type "thirdEmailAddress" in "userRegistration_email_textbox" field
    And I tap "userRegistration_dob_textbox" button
    And I tap "userRegistration_dob_okbutton" button
    And I tap "userRegistration_continue_btn" button
    And I type "password" in "password_edittext" field
    And I type "password" in "confirm_password_edittext" field
    And I tap "password_saveBtn" button
    And I tap "password_saveBtn" button
    Then I tap "biometrics_noThanks_btn" button
    And I should see "vegaAccessCodeHeader" header

  @HCP_Code_Validation @OnboardingAndRegistration
  Scenario: User's email is fetched and verified. Verifying if User is returned back to Vega App by clicking on 'Return to Vega' button on Email Verification Page
    And I fetch the User Registration Url of "thirdEmailAddress" and launch the url in the browser
    And I relaunch app

  @HCP_Code_Validation @OnboardingAndRegistration
  Scenario: Validation of Vega Access Code Field by passing partial invalid HCP Code
    And I should see "vegaAccessCodeHeader" header
    And I should see "vegaAccessCode" field
    And I type "invalidPartialHCPAccessCode" in "vegaAccessCode" field, special characters and alphanumeric characters
    And I validate the text field "vegaAccessCode" with regex "partialHcpCodeRegex" to verify the validations of the field

  @HCP_Code_Validation @OnboardingAndRegistration
  Scenario: Validation of Vega Access Code Field by passing invalid HCP Code
    And I enter "invalidHcpAccessCode" in "vegaAccessCode" field
    And I should see "invalidCodeError_Title" alert
    Then I verify text of "invalidCodeError_Title" as "registrationCode.component.alert.error.title"
    And I verify text of "invalidCodeError_SubText" as "registrationCode.component.alert.error.message"
    And I tap "invalidCodeError_OkButton" button

  @HCP_Code_Validation @OnboardingAndRegistration
  Scenario: Validate the funcationality on entering valid HCP Access Code after Email Verification
    When I type "seventhInstitutionalAccessCode" in "vegaAccessCode" field that is valid
    And I tap "finishSigningUp_btn" button
    And I tap "dataSharingAlert_OkButton" button
    And I should see "addMedicationScreen" screen

  @HCP_Code_Validation @OnboardingAndRegistration
  Scenario: Kill and Reset the App
    Given I reset the Application's memory to clear cache

  @HCP_Code_Validation @OnboardingAndRegistration
  Scenario: User Registration with valid details
    When I tap "welcome_screen_continue_btn" button
    And I tap "register_btn" button
    And I tap "termPrivacy_screen_agree_btn" button
    And I type "firstName" in "userRegistration_firstName_textbox" field
    And I type "validLastName" in "userRegistration_lastName_textbox" field
    And I type "fourthEmailAddress" in "userRegistration_email_textbox" field
    And I tap "userRegistration_dob_textbox" button
    And I tap "userRegistration_dob_okbutton" button
    And I tap "userRegistration_continue_btn" button
    And I type "password" in "password_edittext" field
    And I type "password" in "confirm_password_edittext" field
    And I tap "password_saveBtn" button
    And I tap "password_saveBtn" button
    Then I tap "biometrics_noThanks_btn" button
    And I should see "vegaAccessCodeHeader" header

  @HCP_Code_Validation @OnboardingAndRegistration
  Scenario: Validate the funcationality on entering valid HCP Access Code by skipping Email Verification
    And I type "hcpAccessCode" in "vegaAccessCode" field, special characters and alphanumeric characters
    Then I should see "verifyEmail_header" header

  @EmailVerification @OnboardingAndRegistration
  Scenario: User Registration with valid details
    Given I reset the Application's memory to clear cache
    When I tap "welcome_screen_continue_btn" button
    And I tap "register_btn" button
    And I tap "termPrivacy_screen_agree_btn" button
    And I type "firstName" in "userRegistration_firstName_textbox" field
    And I type "validLastName" in "userRegistration_lastName_textbox" field
    And I type "fifthEmailAddress" in "userRegistration_email_textbox" field
    And I tap "userRegistration_dob_textbox" button
    And I tap "userRegistration_dob_okbutton" button
    And I tap "userRegistration_continue_btn" button
    And I type "password" in "password_edittext" field
    And I type "password" in "confirm_password_edittext" field
    And I tap "password_saveBtn" button
    And I tap "password_saveBtn" button
    Then I tap "biometrics_noThanks_btn" button
    And I should see "vegaAccessCodeHeader" header

  @EmailVerification @OnboardingAndRegistration
  Scenario: User's email is fetched and verified. Verifying if User is returned back to Vega App by clicking on 'Return to Vega' button on Email Verification Page
    And I fetch the User Registration Url of "fifthEmailAddress" and launch the url in the browser
    And I relaunch app

  @EmailVerification @OnboardingAndRegistration
  Scenario: User Registration with valid details
    Given I reset the Application's memory to clear cache
    When I tap "welcome_screen_continue_btn" button
    And I tap "register_btn" button
    And I tap "termPrivacy_screen_agree_btn" button
    And I type "firstName" in "userRegistration_firstName_textbox" field
    And I type "validLastName" in "userRegistration_lastName_textbox" field
    And I type "sixthEmailAddress" in "userRegistration_email_textbox" field
    And I tap "userRegistration_dob_textbox" button
    And I tap "userRegistration_dob_okbutton" button
    And I tap "userRegistration_continue_btn" button
    And I type "password" in "password_edittext" field
    And I type "password" in "confirm_password_edittext" field
    And I tap "password_saveBtn" button
    And I tap "password_saveBtn" button
    Then I tap "biometrics_noThanks_btn" button
    And I should see "vegaAccessCodeHeader" header

  @EmailVerification @OnboardingAndRegistration
  Scenario: User's email is fetched and verified. App is uninstalled, Verifying if User stays on Email Confirmation Page on clicking 'Return to Vega' button.
    When I uninstall the Application
    And I fetch the User Registration Url of "sixthEmailAddress" and launch the url in the browser
    Then I verify app in "not-installed"  state

  @resend-verification-email @OnboardingAndRegistration
  Scenario: User Registration with valid details
    Given I reset the Application's memory to clear cache
    When I tap "welcome_screen_continue_btn" button
    And I tap "register_btn" button
    And I tap "termPrivacy_screen_agree_btn" button
    When I type "firstName" in "userRegistration_firstName_textbox" field
    And I type "validLastName" in "userRegistration_lastName_textbox" field
    And I type "seventhEmailAddress" in "userRegistration_email_textbox" field
    And I tap "userRegistration_dob_textbox" button
    And I tap "userRegistration_dob_okbutton" button
    And I tap "userRegistration_continue_btn" button
    And I type "password" in "password_edittext" field
    And I type "password" in "confirm_password_edittext" field
    And I tap "password_saveBtn" button
    And I tap "password_saveBtn" button
    Then I tap "biometrics_noThanks_btn" button
    And I should see "vegaAccessCodeHeader" header
    When I type "institutionalAccessCode" in "vegaAccessCode" field that is valid
    And I tap "finishSigningUp_btn" button
    And I tap "dataSharingAlert_OkButton" button

  @resend-verification-email @OnboardingAndRegistration
  Scenario: Verify application is moved to background when user navigates back from Resend Email Verification Page
    Then I tap androidBackNative button
    And I verify app in "background"  state
    And I relaunch app

  @resend-verification-email @OnboardingAndRegistration
  Scenario: Verify Resend Email Verification Page and on tapping Login, verifying user is navigated to Login Page. On Login user is navigated to Resend Email Verification Page
    Given I should see "verifyEmail_header" header
    And I verify text of "verifyEmail_header" as "emailVerification.text.lblTitle"
    And I verify text of "verifyEmail_subtext" as "emailVerification.text.lblSubTitle"
    And I should see "resendEmail_btn" button
    And I should see "verifyEmail_login_btn" button
    And I tap "verifyEmail_login_btn" button
    And I should see "login_screen" screen
    When I type "seventhEmailAddress" in "login_email_textbox" field
    And I type "password" in "login_password_textbox" field
    Then I tap "login_btn" button
    Then I tap "biometrics_noThanks_btn" button
    Then I should see "verifyEmail_header" header

  @resend-verification-email @OnboardingAndRegistration
  Scenario: Verifying Resend Verification Email Alert and accept the alert to Resend Verification Email
    Given I tap "resendEmail_btn" button
    Then I should see "resendEmail_alert_title" alert
    And I verify text of "resendEmail_alert_title" as "emailVerification.alert.title"
    And I verify text of "resendEmail_alert_subtext" as "emailVerification.alert.message"
    And I should see "resendEmail_alert_ok_btn" button
    Then I tap "resendEmail_alert_ok_btn" button

  @resend-verification-email @OnboardingAndRegistration
  Scenario: Verify the Email to sucessful navigation to Add Medications screen
    Given I fetch the User Registration Url of "seventhEmailAddress" and launch the url in the browser
    Then I kill app
    And I relaunch app
    And I should see "addMedicationScreen" screen

  @AppTour @OnboardingAndRegistration
  Scenario: Verify that Recording Migraine Days screen is displayed
    Given I reset the Application's memory to clear cache
    When I tap "welcome_screen_continue_btn" button
    And I tap "register_btn" button
    And I tap "termPrivacy_screen_agree_btn" button
    And I type "firstName" in "userRegistration_firstName_textbox" field
    And I type "validLastName" in "userRegistration_lastName_textbox" field
    And I type "eighthEmailAddress" in "userRegistration_email_textbox" field
    And I tap "userRegistration_dob_textbox" button
    And I tap "userRegistration_dob_okbutton" button
    And I tap "userRegistration_continue_btn" button
    And I type "password" in "password_edittext" field
    And I type "password" in "confirm_password_edittext" field
    And I tap "password_saveBtn" button
    And I tap "password_saveBtn" button
    Then I tap "biometrics_noThanks_btn" button
    And I should see "vegaAccessCodeHeader" header
    And I fetch the User Registration Url of "eighthEmailAddress" and launch the url in the browser
    And I relaunch app
    Then I should see "vegaAccessCodeHeader" screen
    When I type "fourthInstitutionalAccessCode" in "vegaAccessCode" field that is valid
    And I tap "finishSigningUp_btn" button
    And I tap "dataSharingAlert_OkButton" button
    And I should see "addMedicationScreen" screen
    And I tap "addMedicationScreen_continue_btn" button
    Then I should see "apptour_screen" screen
    And I should see "apptour_header" header
    And I verify text of "apptour_header" as "userOrientationTutorial.data.0.lblTitle" text
    And I should see "apptour_Subtitle" subheader
    And I verify text of "apptour_Subtitle" as "userOrientationTutorial.data.0.lblSubTitle" text
    And I should see "apptour_today_image" image
    And I should see "apptour_rightarrow" button
    And I should not see "apptour_leftarrow" button
    And I should see "apptour_close" button

  @AppTour @OnboardingAndRegistration
  Scenario: Verify that Describing Your Impact screen is displayed
    When I tap "apptour_rightarrow" button
    Then I should see "apptour_header" header
    And I verify text of "apptour_header" as "userOrientationTutorial.data.1.lblTitle" text
    And I should see "apptour_Subtitle" subheader
    And I verify text of "apptour_Subtitle" as "userOrientationTutorial.data.1.lblSubTitle" text
    And I should see "apptour_close" button
    And I should see "apptour_today_image" image
    And I should see "apptour_rightarrow" button
    And I should see "apptour_leftarrow" button
    When I tap "apptour_leftarrow" button
    Then I verify text of "apptour_header" as "userOrientationTutorial.data.0.lblTitle" text
    And I tap "apptour_rightarrow" button
    And I verify text of "apptour_header" as "userOrientationTutorial.data.1.lblTitle" text

  @AppTour @OnboardingAndRegistration
  Scenario: Verify that Learning Your Triggers screen is displayed
    When I tap "apptour_rightarrow" button
    Then I should see "apptour_header" header
    And I verify text of "apptour_header" as "userOrientationTutorial.data.2.lblTitle" text
    And I should see "apptour_Subtitle" subheader
    And I verify text of "apptour_Subtitle" as "userOrientationTutorial.data.2.lblSubTitle" text
    And I should see "apptour_close" button
    And I should see "apptour_today_image" image
    And I should see "apptour_rightarrow" button
    And I should see "apptour_leftarrow" button
    When I tap "apptour_leftarrow" button
    Then I verify text of "apptour_header" as "userOrientationTutorial.data.1.lblTitle" text
    And I tap "apptour_rightarrow" button
    And I verify text of "apptour_header" as "userOrientationTutorial.data.2.lblTitle" text

  @AppTour @OnboardingAndRegistration
  Scenario: Verify that Calendar screen is displayed
    When I tap "apptour_rightarrow" button
    Then I should see "apptour_header" header
    And I verify text of "apptour_header" as "userOrientationTutorial.data.3.lblTitle" text
    And I should see "apptour_Subtitle" subheader
    And I verify text of "apptour_Subtitle" as "userOrientationTutorial.data.3.lblSubTitle" text
    And I should see "apptour_close" button
    And I should see "apptour_today_image" image
    And I should see "apptour_rightarrow" button
    And I should see "apptour_leftarrow" button
    When I tap "apptour_leftarrow" button
    Then I verify text of "apptour_header" as "userOrientationTutorial.data.2.lblTitle" text
    And I tap "apptour_rightarrow" button
    And I verify text of "apptour_header" as "userOrientationTutorial.data.3.lblTitle" text

  @AppTour @OnboardingAndRegistration
  Scenario: Verify that Reports screen is displayed
    When I tap "apptour_rightarrow" button
    Then I should see "apptour_header" header
    And I verify text of "apptour_header" as "userOrientationTutorial.data.4.lblTitle" text
    And I should see "apptour_Subtitle" subheader
    And I verify text of "apptour_Subtitle" as "userOrientationTutorial.data.4.lblSubTitle" text
    And I should see "apptour_close" button
    And I should see "apptour_today_image" image
    And I should see "apptour_finish" button
    And I should see "apptour_leftarrow" button
    When I tap "apptour_leftarrow" button
    Then I verify text of "apptour_header" as "userOrientationTutorial.data.3.lblTitle" text
    And I tap "apptour_rightarrow" button
    And I verify text of "apptour_header" as "userOrientationTutorial.data.4.lblTitle" text

  @AppTour @OnboardingAndRegistration
  Scenario: Verify Tapping device back button on tour screen(except first tour screen) moves app to previous tour screen
    When I tap androidBackNative button
    Then I should see "apptour_header" header
    Then I verify text of "apptour_header" as "userOrientationTutorial.data.3.lblTitle" text

  @AppTour @OnboardingAndRegistration
  Scenario: Verify Exiting from the App from App Tour screens
    When I kill app
    And I relaunch app
    Then I should see "apptour_screen" screen

  @AppTour @OnboardingAndRegistration
  Scenario: Verify on tapping Finish button congratulation message is displayed
    Given I should see "apptour_screen" screen
    When I tap "apptour_rightarrow" button
    And I tap "apptour_rightarrow" button
    And I tap "apptour_rightarrow" button
    And I tap "apptour_rightarrow" button
    And I tap "apptour_finish" button
    Then I should see "apptour_confirmation_message" text
    And I verify text of "apptour_confirmation_message" as "AppTour_SuccessTitle" text
    And I verify text of "apptour_confirmation_message2" as "AppTour_SuccessSubTitle" text
    And I should see "apptour_completed_img" image
    And I should see "apptour_btn_continue" button
    And "apptour_btn_continue" should be enabled

  @AppTour @OnboardingAndRegistration
  Scenario: Verify Registration Complete Screen
    When I tap "apptour_btn_continue" button
    Then I should see "today_screen" screen

  @AppTour @OnboardingAndRegistration
  Scenario: Verify on tapping X button congratulation message is displayed
    Given I tap "todayScreen_settingsBtn" button
    Then I tap "settingsScreen_ManageAccount" menu
    And I tap "logout_btn" button
    And I tap "logout_yes_button" button
    Then I should see "login_screen" screen
    And I tap "register_btn" button
    And I tap "termPrivacy_screen_agree_btn" button
    And I type "firstName" in "userRegistration_firstName_textbox" field
    And I type "validLastName" in "userRegistration_lastName_textbox" field
    And I type "ninthEmailAddress" in "userRegistration_email_textbox" field
    And I tap "userRegistration_dob_textbox" button
    And I tap "userRegistration_dob_okbutton" button
    And I tap "userRegistration_continue_btn" button
    And I type "password" in "password_edittext" field
    And I type "password" in "confirm_password_edittext" field
    And I tap "password_saveBtn" button
    And I tap "password_saveBtn" button
    Then I tap "biometrics_noThanks_btn" button
    And I tap "login_alert_ok_btn" button
    And I should see "vegaAccessCodeHeader" header
    And I fetch the User Registration Url of "ninthEmailAddress" and launch the url in the browser
    And I relaunch app
    Then I should see "vegaAccessCodeHeader" screen
    When I type "secondInstitutionalAccessCode" in "vegaAccessCode" field that is valid
    And I tap "finishSigningUp_btn" button
    And I tap "dataSharingAlert_OkButton" button
    And I should see "addMedicationScreen" screen
    And I tap "addMedicationScreen_continue_btn" button
    Then I should see "apptour_screen" screen
    And I should see "apptour_close" button
    When I tap "apptour_close" button
    Then I should see "apptour_confirmation_message" text
    And I verify text of "apptour_confirmation_message" as "AppTour_SuccessTitle" text
    And I verify text of "apptour_confirmation_message2" as "AppTour_SuccessSubTitle" text
    And I should see "apptour_completed_img" image
    And I should see "apptour_btn_continue" button
    And "apptour_btn_continue" should be enabled

  @AppTour @OnboardingAndRegistration
  Scenario: Verify Tapping Back Button on the device moves app to the background
    When I tap androidBackNative button
    Then I verify app in "background"  state

  @AppTour @OnboardingAndRegistration
  Scenario: Verify Tapping device back button on first tour screen moves app to Registration Complete screen
    When I relaunch app
    Then I should see "today_screen" screen
    Given I tap "todayScreen_settingsBtn" button
    Then I tap "settingsScreen_ManageAccount" menu
    And I tap "logout_btn" button
    And I tap "logout_yes_button" button
    Then I should see "login_screen" screen
    And I tap "register_btn" button
    And I tap "termPrivacy_screen_agree_btn" button
    And I type "firstName" in "userRegistration_firstName_textbox" field
    And I type "validLastName" in "userRegistration_lastName_textbox" field
    And I type "tenthEmailAddress" in "userRegistration_email_textbox" field
    And I tap "userRegistration_dob_textbox" button
    And I tap "userRegistration_dob_okbutton" button
    And I tap "userRegistration_continue_btn" button
    And I type "password" in "password_edittext" field
    And I type "password" in "confirm_password_edittext" field
    And I tap "password_saveBtn" button
    And I tap "password_saveBtn" button
    Then I tap "biometrics_noThanks_btn" button
    And I tap "login_alert_ok_btn" button
    And I should see "vegaAccessCodeHeader" header
    And I fetch the User Registration Url of "tenthEmailAddress" and launch the url in the browser
    And I relaunch app
    Then I should see "vegaAccessCodeHeader" screen
    When I type "thirdInstitutionalAccessCode" in "vegaAccessCode" field that is valid
    And I tap "finishSigningUp_btn" button
    And I tap "dataSharingAlert_OkButton" button
    And I should see "addMedicationScreen" screen
    And I tap "addMedicationScreen_continue_btn" button
    Then I should see "apptour_screen" screen
    When I tap androidBackNative button
    Then I should see "apptour_confirmation_message" text

  @AppTour @OnboardingAndRegistration
  Scenario: Verify Exiting the App from Registration Complete Screen
    Given I should see "apptour_confirmation_message" text
    And  I kill app
    And I relaunch app
    Then I should see "today_screen" screen

  @Institutional_Code_Validation @OnboardingAndRegistration
  Scenario: User Registration with valid details
    Given I reset the Application's memory to clear cache
    When I tap "welcome_screen_continue_btn" button
    And I tap "register_btn" button
    And I tap "termPrivacy_screen_agree_btn" button
    And I type "firstName" in "userRegistration_firstName_textbox" field
    And I type "lastName" in "userRegistration_lastName_textbox" field
    And I type "eleventhEmailAddress" in "userRegistration_email_textbox" field
    And I tap "userRegistration_dob_textbox" button
    And I tap "userRegistration_dob_okbutton" button
    And I tap "userRegistration_continue_btn" button
    And I type "password" in "password_edittext" field
    And I type "password" in "confirm_password_edittext" field
    And I tap "password_saveBtn" button
    And I tap "password_saveBtn" button
    Then I tap "biometrics_noThanks_btn" button
    And I should see "vegaAccessCodeHeader" header

  @Institutional_Code_Validation @OnboardingAndRegistration
  Scenario: User's email is fetched and verified. Verifying if User is returned back to Vega App by clicking on 'Return to Vega' button on Email Verification Page
    And I fetch the User Registration Url of "eleventhEmailAddress" and launch the url in the browser
    When I kill app
    And I relaunch app
    
  @Institutional_Code_Validation @OnboardingAndRegistration
  Scenario: Verify Vega Access Code page, text verification, field validations
    And I should see "vegaAccessCodeHeader" header
    And I verify text of "vegaAccessCodeHeader" as "registrationCode.component.entry.text.title"
    And I verify text of "vegaAccessSubText" as "registrationCode.component.entry.text.subTitle"
    And I should see "vegaAccessCode" field
    And I verify text of "vegaAccessCode" as "registrationCode.component.entry.text.placeHolder"
    And I verify text of "noAccessCode_btn" as "registrationCode.component.entry.text.btnRegistrationCode"
    And I verify text of "finishSigningUp_btn" as "registrationCode.component.entry.text.btnSubmit"
    And I tap "vegaAccessCode" button
    And I should see "noAccessCode_btn" field
    And I should see "finishSigningUp_btn" field
    And "finishSigningUp_btn" should be disabled
    And I type "invalidInstitutionalAccessCodeWithSpecialChars" in "vegaAccessCode" field, special characters and alphanumeric characters
    Then "finishSigningUp_btn" should be enabled
    And I validate the text field "vegaAccessCode" with regex "institutionalCodeRegex" to verify the validations of the field
    Then I tap "noAccessCode_btn" button
    And I should see "noAccessCode_title" screen

  @Institutional_Code_Validation @OnboardingAndRegistration
  Scenario: Validation of Vega Institutional Code field by entering 20 max characters
    When I tap androidBackNative button to view Vega Access Code screen
    And I type "firstThreeInstitutionalCode" in "vegaAccessCode" field
    And I validate the text field "vegaAccessCode" with regex "institutionalCodeRegex" to verify the validations of the field
    And I type "invalidInstitutionalCodeGreaterThan20Chars" in "vegaAccessCode" field
    And I should see "noAccessCode_max20CharsErrorText" text

  @Institutional_Code_Validation @OnboardingAndRegistration
  Scenario: Validation of Invalid HCP Code Alert on passing invalid Institutional Code
    When I type "invalidInstitutionalAccessCode" in "vegaAccessCode" field that is invalid
    And I tap "finishSigningUp_btn" button
    And I should see "invalidCodeError_Title" alert
    Then I verify text of "invalidCodeError_Title" as "registrationCode.component.alert.error.title"
    And I verify text of "invalidCodeError_SubText" as "registrationCode.component.alert.error.message"
    And I tap "invalidCodeError_OkButton" button

  @Institutional_Code_Validation @OnboardingAndRegistration
  Scenario: Validation of Duplicate Insititutional Code Error Alert
    When I type "invalidDuplicateInstitutionalAccessCode" in "vegaAccessCode" field that is unique and valid
    And I tap "finishSigningUp_btn" button
    And I should see "dataSharingAlert_Title" alert
    And I tap "dataSharingAlert_OkButton" button
    And I should see "duplicateDataSharingAlert_Title" alert
    Then I verify text of "invalidCodeError_Title" as "error.alertInfo.duplicatedDataSharingCode.title"
    And I verify text of "invalidCodeError_SubText" as "error.alertInfo.duplicatedDataSharingCode.message"
    And I tap "duplicateDataSharingAlert_OkButton" button

  @Institutional_Code_Validation @OnboardingAndRegistration
  Scenario: Functionality check on entering valid Institutional Access Code  post Email Verification
    When I type "eleventhInstitutionalAccessCode" in "vegaAccessCode" field that is valid
    And I tap "finishSigningUp_btn" button
    And I should see "dataSharingAlert_Title" alert
    Then I verify text of "dataSharingAlert_Title" as "DataSharing_11A_Institution"
    And I verify text of "dataSharingAlert_SubText" as "registrationCode.component.alert.dataSharing.message"
    When I kill app
    And I relaunch app
    Then I should see "vegaAccessCodeHeader" screen
    When I type "eleventhInstitutionalAccessCode" in "vegaAccessCode" field that is valid
    And I tap "finishSigningUp_btn" button
    And I tap "dataSharingAlert_OkButton" button
    And I should see "addMedicationScreen" screen

  @Institutional_Code_Validation @OnboardingAndRegistration
  Scenario: Kill and Reset the App
    Given I reset the Application's memory to clear cache

  @Institutional_Code_Validation @OnboardingAndRegistration
  Scenario: User Registration with valid details
    When I tap "welcome_screen_continue_btn" button
    And I tap "register_btn" button
    And I tap "termPrivacy_screen_agree_btn" button
    And I type "firstName" in "userRegistration_firstName_textbox" field
    And I type "lastName" in "userRegistration_lastName_textbox" field
    And I type "twelfthEmailAddress" in "userRegistration_email_textbox" field
    And I tap "userRegistration_dob_textbox" button
    And I tap "userRegistration_dob_okbutton" button
    And I tap "userRegistration_continue_btn" button
    And I type "password" in "password_edittext" field
    And I type "password" in "confirm_password_edittext" field
    And I tap "password_saveBtn" button
    And I tap "password_saveBtn" button
    Then I tap "biometrics_noThanks_btn" button
    And I should see "vegaAccessCodeHeader" header

  @Institutional_Code_Validation @OnboardingAndRegistration
  Scenario: Functionality check on entering valid Institutional Access Code without verifying Email
    Then I should see "vegaAccessCodeHeader" screen
    When I type "twelfthInstitutionalAccessCode" in "vegaAccessCode" field that is valid
    And I tap "finishSigningUp_btn" button
    And I tap "dataSharingAlert_OkButton" button
    Then I should see "verifyEmail_header" header