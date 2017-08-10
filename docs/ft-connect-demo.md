The _FileThisConnect Demo_ is a single-page application served from _filethis.com_ that embeds an instance of the FileThisConnect web component element. It is a fixture that wraps a UI around the component, letting you configure, control, and play with the instance. All you need to make it work are your FileThis partner account API key and API secret strings. You can obtain copies of these strings by copying them out of your FileThis partner admin console. If you have not yet gotten set up with your own partner account, please contact us.

The purpose of the demo app is to let you get familiar with how the available variants of the web component appear and behave, and how they guide users through complete document fetching workflows, without yet looking "under the hood" to see how the web component element is wired up.

Once you've completed this section you'll be ready to move on to the next, in which you'll learn how to embed the FileThisConnect web component into a very simple website that you serve from your development machine.

## Loading the App

Start by loading the the demo app into your browser from [here](https://filethis.github.io/ft-connect-demo/).

Note that the values you enter into most of the fields in this app will be stored in the browser local storage for your convenience. When you visit the page again, or refresh it, the fields will retain the values you entered previously. Fields which contain secrets are not stored with encryption. If you're not comfortable with leaving them there between sessions, you may click the "Clear" button at the bottom right of the configuration panel when you're done working.

## Configuration

1. If the configuration side-panel on the left of the window is not open, click the right-pointing arrow button at the upper left of the window to open it.
2. Copy and paste both your API key and API secret strings into the labeled fields.
3. Verify that they are valid by clicking the "Test" button to the right of the fields.
4. Create a FileThis user account for testing by clicking the "New" button to the right of the account ID field.
5. Observe that an account ID number appears in the field.
6. Test the validity of the account ID by clicking the "Test" button to the right of the field. You can do this at any point in the future as a sanity check.
7. Create a user access token for the account by clicking the "New" button to the right of the "Token" field.
8. Observe that a token string appears in the field.
9. Test the validity of the token by clicking the "Test" button to the right of the field. This is useful for testing whether your token has expired, or not before using it for additional testing.
10. Observe that there are two "variants" of the FileThisConnect web component available under the popup menu in the middle of the header bar of the main panel. These are: _ft-connect-expand-out_ and _ft-connect-tabbed_. The former lets the user see a number of panels on the screen at the same time, expanding out to the right side of the web component element for each panel. The latter makes better use of screen real estate, placing each panel into a tab bar. You can chose the variant to use now, and you can change it later, once the web component is running. Other variants will be available shortly.


## Bringing the Web Component to Life

Having created a user account and user token, these will be injected into the instance of the FileThisConnect web component element for you. The main panel of the demo app is where the component is embedded. To turn it on, click the "power" button at the top right of the window. You should see the component appear, showing a list of company logos for websites from which we can fetch documents. The component is now "alive" and communicating with the FileThis production server.

If an error occurs during the use of the web component instance, an error dialog will be displayed by the demo app, and the component will be turned off, as indicated by the power button at the top right. The expiration of the user token is one such error case. When you embed the component into your product's website, you will likely wire up your own handler for error events to deal with things in your own way.

Depending on which variant of the web component you selected, you will see one or more of the "panel" sub-components at different points in the user workflows. We describe each of these, next.

## The "Sites" Panel

The first step in any FileThis user workflow is to allow the user to find and select a company website from which they can fetch their documents. The FileThisConnect web component variants all begin by presenting the user with a list of all companies to which we can connect. We have a sub-component named [ft-source-panel](https://filethis.github.io/ft-source-panel/components/ft-source-panel/) which provides this functionality.

The web component instance in your demo app begins by displaying this panel. Note that users can narrow down which companies are displayed by selecting a filter preset from a popup menu, and/or by entering a search string which matches company names. When the user recognizes a company to which they want to connect, they click its logo. When they do so, the component poses a modal dialog that prompts them to enter their username and password for the site's account. When they commit the dialog, the component tells the FileThis server to create the connection and kick off the document-fetching operation.

You're welcome to test fetching documents from any website for which you have valid credentials, but for the sake of convenience you might begin by connecting to our test website. Depending on the fake password string you enter when you connect to the test site, you can explore a variety of different user workflows in a deterministic manner. You can find the test site in the company list by typing "test" into the search field. For example, you can choose a "happy path" that always returns a list of fake billing statements, never interrupting the workflow with a challenge question. The credentials that specify this workflow are:

```
Username: user
Password: bills
```

Or, you can cause the site to challenge you with any of several kinds of questions. [This page](https://filethis.github.io/developer-docs/pdfs/filethis-test-site-usage.pdf) documents the variety of use cases that the test site can simulate.

## The "Connections" Panel

Having created a connection, either to our test site, or a real-world company site, you will see a representation of the connection appear in a list in the next panel —an instance of our [ft-connection-panel](https://filethis.github.io/ft-connection-panel/components/ft-source-panel/) subcomponent.

As soon as a connection is created, our server kicks off the first document fetching job for it. This takes about as long to complete as it would take a speedy user to log in directly to the company site in their web browser, navigate to the download page, click the appropriate button to start the download, wait for available documents in a certain date range to finish downloading, and then log out. Because this process isn't instantaneous, the web component provides feedback to users to give them a sense of progress and to show them that they're being saved from having to do some rather tedious manual work.

Note that an indeterminate progress indicator spins within the connection item that you created, indicating that work is being done. As soon as each document is downloaded by our service, you will see a thumbnail of the document's first page appear in the web component. After the last document appears, the progress indicator in the connection item stops spinning, and it returns to a resting state, showing the date of the last successful fetch operation.

It's not uncommon for websites to pose challenge questions after users log in successfully with their username and password. These can be questions like "What is your mother's maiden name?", or multiple-choice questions, or a prompt for a PIN code. When our fetching service encounters such a question on a website, it must be conveyed to the user on your website by some means, so that it can be answered by them. The answer they provide must then be sent back to our fetching service so that the operation can resume. The FileThisConnect web component handles this back-and-forth for you, dynamically rendering a modal dialog on your website to pose the question to the user, collecting their answer, and returning it to our service.

Our test site provides a convenient and deterministic way to test a variety of workflows that include challenge questions of different types. Again, [this document](https://filethis.github.io/developer-docs/pdfs/filethis-test-site-usage.pdf) tells you which fake password string to use to determine the workflow to simulate.

If you're curious about the internal representation of challenge questions used by FileThis, take a look at [this application](https://filethis.github.io/ft-user-interactions-demo/). The left-side column shows the JSON data that represents the question. The center column is a live instance of our [ft-user-interaction-form](https://filethis.github.io/ft-user-interaction-form/components/ft-user-interaction-form/) sub-component which dynamically renders the question data as a modal dialog. The right-side column displays the JSON data that represents the answer that the user enters into the dialog.

## The "Documents" Panel

We mentioned above that as documents start to be fetched from a company website for the connections created by a user, we display thumbnails of their first page in our web component. This uses an instance of our [ft-document-panel](https://filethis.github.io/ft-connection-panel/components/ft-document-panel/) sub-component. The display of this panel is optional, but it gives the user a rewarding sense that real work is being done on their behalf.


## The Next Step

Now that you've been able to play with an instance of the FileThisConnect web component in an application served by our servers, you are ready to take another step on your way to fully embedding the component into your own website. In the next section, you'll go a bit further, instantiating the component in a minimal website that is served from your development box.