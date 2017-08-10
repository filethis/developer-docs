# FileThisConnect Minimal Site

### What this is

FileThis provides a Polymer application named `ft-connect-minimal-site` whose purpose is to serve as a stepping-stone between running a FileThisConnect web component example that is hosted by us to embedding the component into your own website and services. You can think of this project as a stripped-down version of the `ft-connect-demo` that you host locally, on your development machine. There is no support in this app for creating a FileThis user account and user access token, as there is in the `ft-connect-demo` app. Instead, you'll simply paste pre-created user account id and access token strings into the component attributes in a simple HTML page. Later, when you embed the component into your real website, your code will need obtain these values by calling our API and then inject them into the component.

### What it is for

In addition to illustrating the simplicity of embeddeding the component element into a page, when you finish the instructions below you will have installed a number of development tools that you'll need later when you proceed to embedding the component into your own site.

### Prerequisites

You should have completed the previous section, The FileThis Connect Demo. You will need to use that app to obtain a user account ID and access token for use in this section.

### When you're done

You will go on to the next section, foobar, having set up your dev env...

## Development Environment Setup

There are a number of tools you'll need to install to support bootstrapping the `ft-connect-minimal-site` project and running it on your dev machine.

The following instructions assume you have a Unix-like shell environment, but should work without too much trouble on a Windows box, as well. Feedback about how to improve the instructions for the Windows platform is welcome.

### Install the Node Package Manager

The Node Package Manager (NPM) makes it easy to download and install Javascript tools and libraries from the command line. We need it for just one reason: to install a tool called Bower, which is yet another package manager. Bower is used by Polymer (though there is talk about moving to NPM, instead).

The easiest way to install the _npm_ command line tool is to install the whole NodeJS package. You can get the installer from [here](https://nodejs.org/en/).

Once it's installed, verify that the _npm_ command is available in your terminal by running:

    npm --version

and observing that you are given a version number.

### Install Git

Bower uses Git to store the code and version tags associated with the packages that it manages. The _git_ command line tool must be installed on your machine in order for it to work.

There are many ways to install Git on each platform. Follow [this guide](https://git-scm.com/book/en/v1/Getting-Started-Installing-Git) to decide the best way for you. 

When you're done, verify that the _git_ command is available in your terminal by running:
                              
    git --version

### Install Bower

Next, we use NPM to install Bower. Run this command:

    npm install -g bower

You should see some verbose progress information fly by as other packages that Bower depends on are installed, ending with some indication of success.

Verify that you have the _bower_ command available in your terminal by running:

    bower --version

### Choose a webserver

In order to run the `ft-connect-minimal-site` app, you'll need to serve its project files so that your browser can render them. If you already have a favorite local webserver of some kind, you can skip this step. If you don't, here are some options:

#### BrowserSync

[BrowserSync](https://www.browsersync.io/) is a personal favorite at FileThis and is highly recommended. Among several nifty features is one that automatically reloads the page when any served file changes —Make a change in your editor, save it, see the page rerender with the change.

Install with:

    npm install -g browser-sync

and run with:

    browser-sync start --config "bs-config.js" --server --port 3505

Note that if you want to the use the configuration options in the _bs-config.js_ file, you will need to run this from inside your `ft-connect-minimal-site` project directory. If you don't use this file, you'll need to either define your own, or add configuration options to the command line.

You can take advantage of BrowserSync's automatic loading feature even if you choose to use your own webserver, or one of the options listed below by using its "proxy" feature.

    browser-sync start --proxy localhost:8888 --config "bs-config.js" --server --port 3505

where "localhost:8888" is the URL of your webserver

#### Python 2.7+

Assuming you already have Python 2.7 installed, run with:

    python -m SimpleHTTPServer 3505
     
#### Python 3.x

Assuming you already have Python 3 installed, run with:

    python -m http.server 3505
     
#### Ruby 1.9.2+

Assuming you already have Ruby installed, run with:

    ruby -run -ehttpd . -p3505
    
#### node-static

Install with:

    npm install -g node-static

and run with:

    ruby -run -ehttpd . -p3505

#### PHP 5.4+

Assuming you already have PHP installed, run with:

    php -S 127.0.0.1:3505

     
## Runtime Environment Setup

Now you're ready to download the `ft-connect-minimal-site` code to your development machine and install the libraries that it needs to run.

#### Get the project source code

Find a place for the project code to live on your filesystem and clone the remote repository using:

    git clone git@github.com:filethis/ft-connect-minimal-site.git

Then move into the created project directory:

    cd ft-connect-minimal-site

#### Install the dependent libraries

Now we can use Bower to download and install all the other polymer elements that the app uses, as well as the small Polymer runtime support library.

If you're curious, take a look at the list of dependencies in the _bower.json_ file in the project directory. The _bower_ command will read each of these in turn and pull down not only these dependencies, but any dependencies of the listed packages, recursively.

While still inside your `ft-connect-minimal-site` directory, install the dependencies by running:

    bower install

You will see a lot of progress information go by. It should complete without error or interruption.

When done, take a look in your project directory and observe that there is a new directory called _bower_components_. This should be full of a number of Polymer components that the project depends on.

For future reference, you will need to deploy a copy of the _bower_components_ directory to your production server so that your chosen FileThisConnect component can load the elements that it needs.


## Runtime configuration

True to its name, this project is "minimal" in the sense that it does not provide any runtime support for either creating a FileThis user account, or for obtaining a user access token. You will need to paste literal values for both of these into the source code before running it.

#### Get an account ID and user access token

We assume you are already set up with a FileThis partner account and are familiar with the [ft-connect-demo](https://filethis.github.io/ft-connect-demo) application. Go to that app now and copy a valid FileThis account id and a user access token. You might create a fresh token so that it does not expire anytime soon.

#### Configure the account ID and user access token

In an editor, open the _./src/ft-connect-minimal-site.html_ file in your project directory. Locate the _user-account-id_ attribute of the element and paste the account id string into its value. Locate the _token_ attribute and paste the token string into its value. Save your changes.


#### About CORS

It may already have occurred to you to there is a potential problem here: Browsers prevent access to data from more than one domain in order to prevent cross-site script exploits. Our component is about to be loaded from your local file system (domain _localhost_), and it intends to make _XMLHttpRequest_ ("AJAX") calls to the FileThis service, (domain _filethis.com_). Unless we do something special, your browser will happily load the component, and then simply refuse to make the HTTP requests to FileThis.

Fortunately, browser manufacturers have provided a way to make specific exceptions to the cross-domain restriction in a safe manner. They call this Cross-Origin Resource Sharing, or CORS, for short. In brief, it works like this:
 
 1. When the browser is asked to send an HTTP request to an origin other than the one from which the site was originally loaded, it first builds a "preflight" request that has the same URL and contains all the same headers as the actual request.
 2. The browser sends its preflight request to the server using the _OPTIONS_ HTTP verb.
 3. Upon receiving this _OPTIONS_ request, the server reads the domain name and port from the request's _ORIGIN_ header (_http://localhost:3505_, in our case) and looks this up in an internal whitelist table of some kind. If it finds a match, it responds with success to the _OPTIONS_ request, returning a 200 result code. If it does not find a match, it returns with a non-200 response. We mention in passing that there are other request and response headers which further refine what the requestor is asking to do and, in turn, what server will allow.
 4. When it receives a 200 response to its _OPTIONS_ preflight request, the browser then sends the original request, and things proceed normally.
 
To make things easy, the FileThis server has been preconfigured to include a CORS whitelist entry for the address: "http://localhost:3505" so that developers can run the `ft-connect-minimal-site` component out of the box. For this reason, be sure that your webserver serves your copy of the project files using the port number 3505.

At this point, you may be wondering how things are handled once you move your code from your development box (_localhost_) to your testing, staging, and production systems. The FileThisConnect component that you embed into your website will be served, along with all your other files, from your own domains. The FileThis server will need to have a CORS whitelist entry for your address —something like `https://acme.com` and `https://staging.acme.com`. We are working on an enhanced version of our partner console that will allow you to edit your own whitelist. Until this is released, you can either:

1. Use the FileThis API to [read](https://filethis.com/developers/doc/index.html#!/partners/getPartnerUsingGET) and [update](https://filethis.com/developers/doc/index.html#!/partners/updatePartnerUsingPUT) the "cors" property of your "partner" resource. (If you have more than one domain, use a comma to separate each of them.)
2. Just send us a list of your addresses and we will update your whitelist for you.

## Next steps

You've already used the `ft-connect-demo`  app, and now brought up the minimal app. The next logical step is to actually embed an instance of the FileThisConnect element into your own website.

We suggest starting by embedding this minimal element, hardcoded account ID, user access token, and all. Then proceeding to the task of writing code in your system to obtain these programmatically.