Jenkins CI Installation on Ubuntu 12.04.3
=========================================
These instructions were tested 2013-09-26 which installed the following
versions.

```
jenkins 1.532
Credentials Plugin 1.8.3
Github API Plugin 1.44
Github Plugin 1.8
xUnit Plugin 1.61
```

### Installation
```
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins
```

The basic workflow used during the project was that everyone get commit access
to the main repository on GitHub. For each push Jenkins build all Ada projects
and corresponding test projects. As output from AUnit (unit testing within Ada)
XML files were used. These XML files could then be parsed by the xUnit plugin
for Jenkins and presented as user friendly results. The final step was to let
the Github Plugin update the commit status on Github.

1. First install Jenkins according to the instructions above.
2. Configuration was done through the webinterface so following steps are
through any suitable webbrowser.
3. Go to <domain>:8080
4. Go to "Manage Jenkins" > "Manage Plugins" > "Advanced" (tab)
5. Press "Check now" in the bottom right corner to update list of available plugins.
6. Go to "Available" tab.
7. Check "Github plugin" and "xUnit plugin", install without restart.
(If it does not work, try again).
8. Go to "Updates" (tab) and make sure that the "Credentials plugin" is up to date.
9. Enable basic security. Go to "Mange Jenkins" > "Configure Global Security".
10. Check to box "Enable security".
11. Choose "Jenkins own user database".
12. Check "Allow users to sign up" if it is not already checked.
13. Check "Logged-in users can do anything".
14. Press apply or save.
15. Sign up for a new account.

### Configuration
1. Go to "Manage Jenkins" > "Configure System"
2. Under the "Git" section the default values should be enough.
3. Under the "Git plugin" section set any value that you found reasonable.

4. Go back to start page.
5. Select "New Job".
6. Select a suitable "Job name" without spaces (stay with lower-case, dash and underscore).
7. Select "Build a free-style software project" and press "OK".
8. On the new page fill in a simple description (will help you in the long run).
9. Fill in your GitHub Project URL in the first section.
10. Under "Source Code Management" select Git and fill in repository URL again.
11. Other values will probably work just fine as defaults.
12. Under "Build triggers" select "Poll SCM".
("Build when a change is pushed to GitHub" is preferred but without a public ip,
it is not possible.)
13. As Schedule "H/5 * * * *" will be more than enough.
14. Under "Build" add new build step "Execute shell".

```
export PATH=/usr/gnat/bin:$PATH
env | grep -i shell
./build_script /var/lib/jenkins/workspace/naiad-auv-software/src/
```
The above lines are for debbugging to make sure you have the correct path
for compiling Ada with gnatmake. As well as confirming you are running bash
as shell and nothing else.

The last lines runs the build script that is located in the root of the
git repository. As input it takes the source directory to build.

15. Under the section "Post-build Actions" add "Publish xUnit test result report".
16. Then in the "Add" drop-down select "AUnit-3.x (default)".
17. As "AUnit-3.x (default) Pattern" fill in "**/xml_results/*.xml".
18. Other values as you preferred.
19. Add the second "post-build action" which is "Set build status on GitHub commit".
20. Press save.
21. Go to the project and press "Build now".

### Upgrade
```
sudo apt-get update
sudo apt-get upgrade
```

### Extra random information
GitHub Pull Request Builder 1.9 was installed as well and tested but we settled
for a workflow without pull-requests on Github. Everyone got access to the
needed repositories that were created through the organization "naiad-auv".

### Disabling security
If you accidently enable security without a user account you can disable security
by doing the following. Information from
https://wiki.jenkins-ci.org/display/JENKINS/Disable+security

On Ubuntu 12.04.3 $JENKINS_HOME is /var/lib/jenkins

One may accidentally set up security realm / authorization in such a way that
you may no longer able to reconfigure Jenkins.

When this happens, you can fix this by the following steps:

    Stop Jenkins (the easiest way to do this is to kill the servlet container.)
    Go to $JENKINS_HOME in the file system and find config.xml file.
    Open this file in the editor.
    Look for the <useSecurity>true</useSecurity> element in this file.
    Replace true with false
    Remove the elements authorizationStrategy and securityRealm
    Start Jenkins

When Jenkins comes back, it's in the unsecured mode where everyone
gets full access to the system.

If this is still not working, trying renaming or deleting config.xml.
