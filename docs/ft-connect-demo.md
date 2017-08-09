# FileThisConnect Demo

### What this is

The FileThisConnect Demo is a Polymer application, hosted by our servers. It is a fixture that providing a GUI that lets you configure, control, and run an instance of a FileThis Connect component

### What it is for

### Prerequisites

If you have not yet received the API key and API secret for your FileThis partner accounts, please contact us. We generally provide one production account and at least one development account.

### When you're done

## Instructions

The FileThisConnect Demo app live on [this page](https://filethis.github.io/ft-connect-demo/).

Note that the values you enter into most of the fields in this app will be stored in the browser local storage for your convenience. When you visit the page again, or refresh it, the fields will retain the values you previously entered. Fields which contain secrets will also be stored in browser local storage and are not encrypted. If you are not comfortable with leaving them there between sessions, you may click the "Clear" button at the bottom right of the panel when you're done working.

#### Configuration

1. If the configuration side-panel on the left of the window is not exposed, click the right-pointing arrow button to open it.
2. Copy and paste both your API key and API secret strings into the labeled fields.
3. Verify that they are valid by clicking the "Test" button to the right of the fields.
4. Create a FileThis user account for testing by clicking the "New" button to the right of the account ID field.
5. Observe that an account ID number appears in the field.
6. Test the validity of the account ID by clicking the "Test" button to the right of the field. You can do this at any point in the future as a sanity check.
7. Create a user access token by clicking the "New" button to the right of the "Token" field.
8. Observe that a token string appears in the field.
9. Test the validity of the token by clicking the "Test" button to the right of the field. This is useful for testing whether your token has expired, or not before using it for additional testing.
10. Observe that there are two "variants" of the FileThisConnect component available under the popup menu in the header of the main panel. These are: _ft-connect-expand-out_ and _ft-connect-tabbed_. The former lets you see a number of panels on the screen at the same time, expanding out to the right side of the component for each panel. The latter makes better use of screen real estate, placing each panel into a tab bar. You can chose the variant to use now, and you can change it later, once the component is running. Other variants will be available shortly.


#### Bringing the Component to Life

Having created a user account and user token, these will be injected into the instance of the FileThisConnect component for you. The main panel of the demo app is where the component lives. To turn it on, click the "power" button at the top right of the window. You should see a list of company logos for websites from which we can fetch documents. At this time, the component is "alive" and communicating with the FileThis production server.

If an error occurs during the use of the component instance, an error dialog will be displayed, and the component will be turned off, as indicated by the power button at the top right. The expiration of the user token is one such error case. When you embed the component into your product's website, you will likely wire up your own handler for error events to deal with things in your own way.

#### The "Sites" Panel

Initially, the component displays a list of the company websites to which FileThis can connect. Note that users can filter which ones are displayed in the panel by selecting a preset filter from a popup menu, and/or by entering a search string which matches company names. When the user recognizes a company to which they want to connect, they click its logo to connect to it. When they do so, the component poses a modal dialog that prompts them to enter their username and password for the site's account. When they commit the dialog, the component tells the FileThis server to create the connection and kick off the document-fetching operation.

You are welcome to test fetching documents from any website for which you have valid credentials, but for the sake of convenience you might begin by connecting to our test website. Depending on the password you use when you connect to the test site, you can explore a variety of different user workflows, like handling challenge questions. You can choose the test site from the company list by typing "test" into the search field. 

step instructions here?

#### The "Connections" Panel

Having created a connection, you will see a representation of it in the connections panel. Note that it has a progress indicator...

#### The "Documents" Panel

As FileThis finds documents on a website and delivers them to your system, thumbnails of their first pages will appear in a panel in the component. This gives users a sense of progress and...

## Next steps
