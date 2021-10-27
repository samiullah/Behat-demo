

<h1 align="center"> Behat Demo  </h1>
<h3 align="center"> Submitted by Sami Ullah</h3>
<h5 align="center">Date: 25th May </h5>

</br>


<!-- TABLE OF CONTENTS -->
<h2 id="table-of-contents"> :book: Table of Contents</h2>

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project"> ➤ About The Project</a></li>
    <li><a href="#prerequisites"> ➤ Prerequisites</a></li>
    <li><a href="#folder-structure"> ➤ Folder Structure</a></li>
    <li><a href="#contributors"> ➤ Contributors</a></li>
     <li><a href="#steps"> ➤ Steps to Run the  Project</a></li>
     <li><a href="#sample"> ➤ Sample Html Report</a></li>
     <li><a href="#gif"> ➤ Sample Test Execution</a></li>
  </ol>
</details>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- ABOUT THE PROJECT -->
<h2 id="about-the-project"> :pencil: About The Project</h2>

<p align="justify">
 This project demonstrates the use of behat as Test automation tool using
 BDD approach. It is part A of Hackathon to be submitted
</p>



![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- PREREQUISITES -->
<h2 id="prerequisites"> :fork_and_knife: Prerequisites</h2>

[![made-with-php](https://img.shields.io/badge/Made%20with-PHP-blue)](https://www.php.net/) <br>


The following open source packages are used in this project:
* Behat
* Mink
* Drupal Extension
* Bex Screenshot
* Emuse BehatHTMLFormatterExtension
* Selenium Standalone Server
* Chromedriver


![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- :paw_prints:-->
<!-- FOLDER STRUCTURE -->
<h2 id="folder-structure"> :cactus: Folder Structure</h2>
Features Folder structure
<pre>
|-- CommonComponents
|   `-- CommonComponents.feature
|-- Content
|   |-- Article.feature
|   `-- Recipes.feature
|-- Forms
|   `-- ContactUs.feature
|-- Moderation
|   `-- ContentModeration.feature
|-- Search
|   |-- AdvancedSearch.feature
|   |-- Search.feature
|   `-- Search_spanish.feature
`-- bootstrap
`-- FeatureContext.php
</pre>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)




<!-- CONTRIBUTORS -->
<h2 id="contributors"> :scroll: Contributors</h2>

<p>
<b>Sami ullah</b> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Email: <a>samireshi002@gmail.com</a> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GitHub: <a href="https://github.com/samiullah">@samiullah</a> <br>
</p>

<br>
✤ <i>This was the first project submission for Hackathon A -

  <h2 id="steps"> :scroll: Steps to run the project  </h2>


1. Clone this repo/project which has all the drupal and behat dependencies

2. Move all the child directories of this project(from "core" directory till web.config file) under your MAMP server location (/Applications/MAMP/htdocs)

3. behat.yml file

```
default:
 suites: default: paths: features: '/Applications/MAMP/htdocs/features' contexts: - FeatureContext - Drupal\DrupalExtension\Context\DrupalContext - Drupal\DrupalExtension\Context\MinkContext - Drupal\DrupalExtension\Context\MessageContext - Drupal\DrupalExtension\Context\DrushContext#        - emuse\BehatHTMLFormatter\Context\ScreenshotContext:
#              screenshotDir: report/html/behat/assets/screenshots
#  formatters:
#    html:
#      output_path: report/html/behat
 extensions: Drupal\MinkExtension: goutte: ~ browser_name: 'chrome' javascript_session: selenium2 selenium2: wd_host: http://127.0.0.1:4444/wd/hub capabilities: { "version": "*", 'chrome': { 'switches': [ '--start-maximized','--window-size=1920,1080'] } }#         capabilities: { "version": "*", 'chrome': { 'switches': [ '--headless','--disable-gpu','--window-size=1920,1080' ] } }

 base_url: http://localhost:8888 files_path:  "%paths.base%/media/images" Drupal\DrupalExtension: blackbox: ~ api_driver: 'drupal' drush: alias: 'local' drupal: drupal_root: '/Applications/MAMP/htdocs/' region_map: preheader: ".region-pre-header" header: ".region-header" highlighted: ".region-highlighted" footer: ".region-footer" content_bottom: ".region-content-bottom" bottom: ".region-bottom" content: ".region-content" selectors: message_selector: '.messages' error_message_selector: '.messages--error' success_message_selector: '.messages--status' warning_message_selector: '.messages--warning' Bex\Behat\ScreenshotExtension: screenshot_taking_mode: failed_scenarios image_drivers: local: screenshot_directory: "%paths.base%/media/failed_screenshots"#    emuse\BehatHTMLFormatter\BehatHTMLFormatterExtension:
#      name: html
#      renderer: Twig,Behat2
#      file_name: index
#      print_args: true
#      print_outp: true
#      loop_break: true
```

4. Execute your behat tests from /Applications/MAMP/htdocs
```
vendor/bin/behat

```
5. For running specific feature file
```
vendor/bin/behat features/article.feature
   ```

6. For running scenario at specific line
```
 vendor/bin/behat features/article.feature:54

   ```

7. For running anonymous user scenarios
```
vendor/bin/behat --tags '@anonymous'
   ```

8. Similarly for other users pass relevant tags
```
 @admin @editor @author @authenticated

   ```
9. For running Spanish or english or scenarios tagged as
   both languages use relevant tags
```
@spanish @english @both-languages

   ```
10. For enabling html reports

- Uncomment all commentted lines in behat.yml
- Use command
```
behat --format html --out reports
```

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)


 <h2 id="sample"> :scroll: Sample Html Report  </h2>

![Behat-Test-Suite](https://user-images.githubusercontent.com/2878977/119474927-47940c80-bd6a-11eb-894f-283a00fe5e52.png)





![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)


  <h2 id="gif"> :scroll: Sample Test Execution  </h2>
<a href="https://asciinema.org/a/7k8JeiOuhYK0nyRib29mNc1dX" target="_blank"><img src="https://asciinema.org/a/7k8JeiOuhYK0nyRib29mNc1dX.svg" /></a>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)
![image](https://user-images.githubusercontent.com/2878977/119480912-c3dd1e80-bd6f-11eb-8db8-ebd69412a4c9.png)
