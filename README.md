## PureFusionOTA Server:


### How to use?
- Create our file based on pme.xml


## Manually

#### Create an ota.xml

The OTA app needs an XML document stored online somewhere to periodically check and compare OTA version values to see if there is an update. You must create this and store it somewhere you can have a direct link access to it. You can use a personal website, or somewhere like dropbox's public folder or private shares.

The XML should look like this:-

``` XML
<?xml version="1.0" encoding="UTF-8"?>
<ROM>
  <!-- Your ROM Name -->
  <RomName>NAME OF THE ROM</RomName>
  <VersionName>ROM VERSION</VersionName>
  <!-- Your ROM version. MUST be incrementally larger than previous versions -->
  <!-- Do NOT use letters in your version number. Integers only -->
  <!-- Previous version will be read from the build.prop -->
  <VersionNumber type="integer">20150105</VersionNumber>
  <!-- Linking to your files -->
    <!-- <DirectUrl><![CDATA[http://www.example.com?file=file.zip?somethingelse&anotherthing]]></DirectUrl> -->
    <!-- Use the above format if your URL has special characters in then, like an (&) ampersand -->
    <!-- Enter <DirectUrl nil="true /> or <HttpUrl nil="true /> to indicate you won't be using a type of URL -->
    <!-- HTTP link will open a web page -->
    <!-- Direct Link overrides HTTP link -->
  <DirectUrl>DIRECT LINKS HERE</DirectUrl>
  <HttpUrl>HTTP WEBSITE LINK HERE</HttpUrl>
  <!-- What version are you issuing? -->
  <Android>5.0.1</Android>
  <!-- Providing File Checking for direct downloads. You SHOULD offer this for your users whether using HTTP or Direct -->
  <!-- OPTIONAL: Enter <CheckMD5 nil="true" /> offer MD5 checking -->
  <CheckMD5>MD5 HERE</CheckMD5>
  <!-- The filesize of your ROM -->
  <!-- Please enter this in BYTES only. Otherwise an incorrect value will be shown -->
  <FileSize type="integer">420147739</FileSize>
  <!-- Developer or Team name. You can put anything here, even a couple of names -->
  <!-- OPTIONAL: Enter <Developer nil="true" /> to hide this -->
  <Developer>DEVELOPER NAMES HERE</Developer>
  <!-- Your ROM or Developer Website. Can be a personal site or your XDA/forum thread -->
  <!-- OPTIONAL: Enter <Website nil="true" /> to hide this -->
  <WebsiteURL>WEBSITE LINK HERE</WebsiteURL>
  <!-- Your Donate URL -->
  <!-- OPTIONAL: Enter <DonateURL nil="true" /> to hide this -->
  <DonateURL>DONATE URL HERE</DonateURL>
  <!-- Put the changelog here... Use Markdown to format it -->
  <!-- Again, surround special characters with the CDATA tags or your XML will NOT parse -->
  <Changelog>### Changelog 20150105
* Stuff
* Updated this, or that
* Fixed all the things
* We even fixed this
* Don't forget all the awesome features you added</Changelog>
</ROM>
```
Please be aware of the rules regarding [special characters in XML documents](http://en.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references#Predefined_entities_in_XML). If your text needs to use them (for example, writing AT&T in the changelog. Or an & symbol in a URL) then you NEED to wrap that text in CDATA tags like this:
```XML
<![CDATA[http://www.example.com?file=file.zip?somethingelse&anotherthing]]>
```
You should also use Markdown for the changelog. This allows easy formatting for you and it renders really well in the app. You can use full Markdown for this, including links and images (be aware of screen sizes, though). The example above shows some basic Markdown in the changelog tags. 

Here are some useful links to help with Markdown:-
- [http://dillinger.io/](http://dillinger.io/) -  to help checking how it looks visually
- [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/markdown-Cheatsheet)

#### Using an optional Addons XML

You may use an addition XML file for providing addon and extra files for your ROM. For instance, kernel files, or quick fixes.

You should format it like this:

``` XML
<?xml version="1.0" encoding="utf-8"?>
<hash>
    <addons>
        <addon>
            <id>1</id> <!-- Use integers only, make them unique -->
            <name>Accuweather</name> <!-- The name, simples -->
            <description>Accuweather Daemon and Widgets</description> <!-- You can use markdown here if you want -->
            <updated-at>2014-12-24</updated-at> <!-- Must be in yyyy-mm-dd format -->
            <size>9001027</size> <!-- filesize in bytes -->
            <download-link>
            http://xyyx-dev.ru/nitrogen-os/nougat/geehrc/addon1.zip
            </download-link>
        </addon>
        <addon>
            <id>2</id> <!-- Use integers only, make them unique -->
            <name>Samsung Wallet</name> <!-- The name, simples -->
            <description>Samsung's Wallet technology</description> <!-- You can use markdown here if you want -->
            <updated-at>2014-10-14</updated-at> <!-- Must be in yyyy-mm-dd format -->
            <size>5427814</size> <!-- filesize in bytes -->
            <download-link>
            http://xyyx-dev.ru/nitrogen-os/nougat/geehrc/addon2.zip
            </download-link>
        </addon>
    </addons>
</hash>
```

Doing this, you should add these following elements to the bottom of your OTA XML

```XML
<AddonCount>2</AddonCount>
<AddonsURL>
http://xyyx-dev.ru/nitrogen-os/nougat/geehrc/addons.xml
</AddonsURL>
```
Taking care to provide a direct link to your XML in the AddonsUrl tag, and providing an accurate count in the AddonCount tag.

