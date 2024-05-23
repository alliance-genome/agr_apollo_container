# Apollo

# Directions for building Apollo for AGR

This repo was cloned from a "standard" repo for building Apollo that was
modified for AGR's use. The original documentation is at the bottom of this README.
This instance of Apollo is only used for "JSON translation." That is, Apollo
is used to read the NCList json that JBrowse uses and then reply with
specialized json that the Sequence Feature Viewer (the javascript widget on
gene and variant pages) consumes. It has to be rebuilt for each release.

# Workflow

1. After the `JBrowseProcessGFF` and `JBrowseProcessVCF` pipelines have
   successfully run in GoCD for a given release, make a release-specific
   branch of agr_jbrowse_config
   (https://github.com/alliance-genome/agr_jbrowse_config) and update the
   release number in `agr_jbrowse_config/scripts/fetch_vcf.sh`
   to refer to the release being built.

2. Also in agr_jbrowse_config, update all references to the previous release
   to the release being built in
   `/agr_jbrowse_config/tree/master/apollo/data/*/trackList.json`
   (that is, there will be several directories with `trackList.json` files in
   them and they will need updating).

3. Commit and push the changes made in 1 & 2.

4. Modify the Dockerfile in this repo to refer to the branch specific
   repo created in step 1. Commit and push that change.

5. In GoCD, unpause the `ApolloSoftwareStage` pipeline to cause the Apollo
   container to rebuild. It should rebuild very quickly (certainly no more
   that a few minutes).

# About Dockerfile.env

Dockerfile.env codes for a base image that the above Dockerfile uses. It is
rebuilt by the `ApolloENVStage` GoCD pipeline and can be very finicky to get
it to rebuild successfully, and when it is successful, the rebuild takes a long
time, usually over 30 minutes. Fortunately, it doesn't often need to be rebuilt
and certainly doesn't need to be rebuilt for each release.

# Documentation that goes with original Apollo container

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3555454.svg)](https://doi.org/10.5281/zenodo.3555454)
![Lint](https://github.com/GMOD/Apollo/workflows/Lint/badge.svg)
![Java CI with Gradle](https://github.com/GMOD/Apollo/workflows/Java%20CI%20with%20Gradle/badge.svg)
[![Documentation](https://readthedocs.org/projects/genomearchitect/badge/?version=latest)](https://genomearchitect.readthedocs.org/en/latest/)
[![Chat at Gitter](https://badges.gitter.im/GMOD/Apollo.svg)](https://gitter.im/GMOD/Apollo?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)
[![License](https://img.shields.io/badge/License-BSD%202--Clause-orange.svg)](https://opensource.org/licenses/BSD-2-Clause)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v1.4%20adopted-ff69b4.svg?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTQiIGhlaWdodD0iMTQiIHZpZXdCb3g9IjAgMCAyNTYgMjU2IiB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiPjx0aXRsZT5Db250cmlidXRvciBDb3ZlbmFudCBMb2dvPC90aXRsZT48ZyBpZD0iQ2FudmFzIj48ZyBpZD0iR3JvdXAiPjxnIGlkPSJTdWJ0cmFjdCI+PHVzZSB4bGluazpocmVmPSIjcGF0aDBfZmlsbCIgZmlsbD0iIzVFMEQ3MyIvPjwvZz48ZyBpZD0iU3VidHJhY3QiPjx1c2UgeGxpbms6aHJlZj0iI3BhdGgxX2ZpbGwiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDU4IDI0KSIgZmlsbD0iIzVFMEQ3MyIvPjwvZz48L2c+PC9nPjxkZWZzPjxwYXRoIGlkPSJwYXRoMF9maWxsIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik0gMTgyLjc4NyAxMi4yODQ2QyAxNzMuMDA1IDkuNDk0MDggMTYyLjY3NyA4IDE1MiA4QyA5MC4xNDQxIDggNDAgNTguMTQ0MSA0MCAxMjBDIDQwIDE4MS44NTYgOTAuMTQ0MSAyMzIgMTUyIDIzMkMgMTg4LjQ2NCAyMzIgMjIwLjg1NyAyMTQuNTc1IDI0MS4zMDggMTg3LjU5OEMgMjE5Ljg3IDIyOC4yNzIgMTc3LjE3MyAyNTYgMTI4IDI1NkMgNTcuMzA3NSAyNTYgMCAxOTguNjkyIDAgMTI4QyAwIDU3LjMwNzUgNTcuMzA3NSAwIDEyOCAwQyAxNDcuNjA0IDAgMTY2LjE3OSA0LjQwNzA5IDE4Mi43ODcgMTIuMjg0NloiLz48cGF0aCBpZD0icGF0aDFfZmlsbCIgZmlsbC1ydWxlPSJldmVub2RkIiBkPSJNIDEzNy4wOSA5LjIxMzQyQyAxMjkuNzU0IDcuMTIwNTYgMTIyLjAwOCA2IDExNCA2QyA2Ny42MDgxIDYgMzAgNDMuNjA4MSAzMCA5MEMgMzAgMTM2LjM5MiA2Ny42MDgxIDE3NCAxMTQgMTc0QyAxNDEuMzQ4IDE3NCAxNjUuNjQzIDE2MC45MzEgMTgwLjk4MSAxNDAuNjk4QyAxNjQuOTAzIDE3MS4yMDQgMTMyLjg4IDE5MiA5NiAxOTJDIDQyLjk4MDcgMTkyIDAgMTQ5LjAxOSAwIDk2QyAwIDQyLjk4MDcgNDIuOTgwNyAwIDk2IDBDIDExMC43MDMgMCAxMjQuNjM0IDMuMzA1MzEgMTM3LjA5IDkuMjEzNDJaIi8+PC9kZWZzPjwvc3ZnPg==)](docs/CODE_OF_CONDUCT.md)

### [![](https://github.com/GMOD/Apollo/blob/master/docs/images/download_small.png)&nbsp;Download the latest release](https://github.com/GMOD/Apollo/releases/latest) ![](docs/images/ApolloLogo_100x36.png)

A collaborative, real-time, genome annotation editor. The stack is a Java web application / database backend and a
Javascript client that runs in a web browser as a JBrowse plugin.

Cite Apollo using `Dunn NA, Unni DR, Diesh C, Munoz-Torres M, Harris NL, Yao E, et al. (2019) Apollo: Democratizing genome annotation. PLoS Comput Biol 15(2): e1006790.` <https://doi.org/10.1371/journal.pcbi.1006790>

Questions / Comments / Community contact can be sent to our [Apollo user mailing list](mailto:apollo@lbl.gov) or posted directory to our [google group](https://groups.google.com/a/lbl.gov/forum/#!forum/apollo). Old questions are [archived on Nabble](http://gmod.827538.n3.nabble.com/Apollo-f815553.html).

Complete Apollo installation and configuration instructions are available from the [Apollo documentation pages](http://genomearchitect.readthedocs.io/en/latest/)

The Apollo client is implemented as a plugin for [JBrowse](http://jbrowse.org). Additional JBrowse plugins may be found in the [JBrowse registry](https://gmod.github.io/jbrowse-registry/) and configured in `apollo-config.groovy`.

We provide a [Demonstration Apollo](docs/Demo.md) site and an integrated service is provided by [UseGalaxy Europe](https://usegalaxy.eu/).

The [User's Guide](docs/UsersGuide.md) provides guidance on how to use it. Please feel free to update this documentation.

## Setup guide

We provide a [Setup guide](docs/Setup.md) for deploying a [configuring](docs/Configure.md) a production instance.

Launchable public Amazon Web Services (AWS) EC2 images may be [launched from Community AMIs in the N. Virginia region under 'Apollo'](docs/images/EC2Image.png).  
Specific information for [setting up AWS instances](docs/Aws_setup.md) is provided for 2.4.1 instances.

Apollo may be launched from [Docker](docs/Docker.md) as well.

The [guide for developers](docs/Apollo2Build.md) shows how to get started with Apollo.

## Web Services

[Python library over web services](https://pypi.org/project/apollo/) and other [web services examples](https://github.com/GMOD/Apollo/tree/develop/docs/web_services/examples).

## Migrating data from older versions

You can follow steps in our [migration guide](docs/Migration.md) to move annotations and data from older versions.

### Note about data directories

Apollo 2.X allows you to add multiple data directories to your webapp, and it expects the data directories to be stored
outside of the tomcat webapps directory. Use the [developer's guide](docs/Apollo2Build.md) to learn how to add new
data directories for your organisms.

**Important Note: All data from a webapps directory will disappear when doing tomcat "undeploy" operations, even if
it is a symlink.**.

### Launch Apollo in a temporary server

To launch Apollo with temporary settings, use the `apollo run-local` command, which will initialize your server
automatically with an H2 (zero-configuration) database.

    apollo run-local 8080

It will also use your custom settings if an apollo-config.groovy file has been setup.

### Generate a war file

Users can generate a war file (for example target/apollo-1.0.2.war) that will be copied into their tomcat webapps
directory for production deployments:

apollo deploy

Note: make sure to create an apollo-config.groovy file following the sample data (e.g.
sample-postgres-apollo-config.groovy) to make sure you use your preferred database settings.

### Run locally for GWT development

    apollo devmode

or in two terminals:

    apollo run-local
    gradlew devmode

### Thanks to

[![YourKit](https://www.yourkit.com/images/yklogo.png)](https://www.yourkit.com/)

YourKit supports open source projects with innovative and intelligent tools
for monitoring and profiling Java and .NET applications.
YourKit is the creator of <a href="https://www.yourkit.com/java/profiler/">YourKit Java Profiler</a>,
<a href="https://www.yourkit.com/.net/profiler/">YourKit .NET Profiler</a>,
and <a href="https://www.yourkit.com/youmonitor/">YourKit YouMonitor</a>.
