# Dr-Pardal

This is the repository for the Front-End of the Dr-Pardal project.

## Requirements

* node.js version >= 5.3.0
* npm version >= 3.3.12
* bower
* GIT

## Getting Started

### GitLab
* Install GIT in your machine [https://git-scm.com/download](https://git-scm.com/download)
* Register an account on Gitlab [https://www.gitlab.com](https://www.gitlab.com) after that you should add your SSH key to gitLab [https://gitlab.com/help/ssh/README](https://gitlab.com/help/ssh/README) once that is done request access from [hugo.mota@tekzenit.com](mailto:hugo.mota@tekzenit.com).
* After you have Git installed you can clone the project to your machine:

```
git clone git@gitlab.com:tekzenit/dr-pardal.git
```

Next you must install the project's dependencies with:

```
npm install
```

Now you can run the project to devolopment with:

```
gulp
```

The output of the `gulp` command should tell the URL in which the project is
running. We are using `xip.io`, so expect something like `http://127.0.0.1.xip.io:3000/`.

Or you can build a dist for deployment with:

```
gulp dist
```

*Note:* If you haven't noticed, you should be on the `develop` branch of your
`git` repository. That's the one we are using as the default. Get your changes
and create your branches from there.


### Folder Structure
```
dr-pardal/
    bower_components/           -> External libraries installed by bower
    gulp/                       -> Gulp Tasks
    node_modules/
    src/                        -> Development code
        images/
        scripts/
            common/             -> Common code used acrosse multiple pages
            pages/              -> Page specific code
            vendor/             -> External Libraries
        styles/
            base/               -> Base styles (typography, etc.)
            components/         -> Styles for flow pages, header and footer, etc
            images/             -> Images called from css
            layout/             -> Grid styles.
            pages/              -> Page specific styles
            tools/
        templates/
            layouts/
            pages/              -> Html for different pages
            partials/           -> Common html code used in multiple pages
```
