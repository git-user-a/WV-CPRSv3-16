<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>WorldVistA CPRSChart Ver 3-16</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	</head>
<body>
  <table border="0" align="center" cellpadding="0" cellspacing="10">
    <tr>
      <td>
        <a href="https://WorldVista.org"> <img align="right" width=80% src="ReadMe\Globe.png" border="0" /><br></a>
      </td>
      <td align="right" valign="top"><h2><i>WorldVistA CPRSChart Ver 3-16</i></h2></td>
    </tr>
    <tr>
      <td colspan=3 align="right" valign="top"><!hr valign="bottom"></td>
    </tr>
		<tr>
			<td valign="top" align="right"> <a name="OVERVIEW"><em><strong>Overview</strong></em></a></td>
			<td style="background-color:#dddddd;"> </td>
		</tr>
    <tr>
      <td valign="top" align="right"><em><strong> </strong></em></td>
      <td>
			<a href="https://en.wikipedia.org/wiki/VistA">VistA</a>
				 is a health information system deployed across all veteran care sites in the United States.
				 VistA is the Client/Server system. The most known VistA client application is <i>CPRSChart.exe</i>.
				The source code of VistA is available by <a href="https://www.foia.gov/">FOIA</a> request.
				WorldVistA EHR 3.1 Ver 3-16 is a version of VistA created<br><br>
	      by the <a href="https://worldvista.org/">WorldVistA</a> open source community.<br><br>
        This document describes process of creation <i>WorldVistA CPRSChart</i>  -
				client application that provides access to a patient data in WorldVistA EHR system.<br><br>
        It does not discuss installation or usage of the EHR Server software.<br><br>
			  The version of <i>CPRSChart</i> for WorldVistA EHR 3.1 Ver 3-16
				will be referred as <i>WV-CPRSv3-16</i> in this text.<br><br>
				Document map:<br><br>
- <a HREF="#DT">Development Tools</a><br>
- <a HREF="#SC">Source Code</a><br>
- <a HREF="#IDE">Delphi IDE Setup</a><br>
- <a HREF="#PC">Package Compilation</a><br>
- <a HREF="#PD">GUI Project Details</a><br>
- <a HREF="#INFO">Additional Information</a>
<br><br>
      </td>
    </tr>
		<tr>
			<td valign="top" align="right"> <a name="DT"><em><strong>Development Tools</strong></em></a>     </td>
			<td style="background-color:#dddddd;"> </td>
		</tr>
    <tr>
      <td align="right" valign="top"><em><strong></strong></em> </td>
      <td >
				<i>CPRSChart</i> was developed with Microsoft Windows 10 and Embarcadero's
				<a href="https://en.wikipedia.org/wiki/Delphi_(software)">Delphi</a>.
        In preparation of this document the source code of WV-CPRSv3-16 was successfully compiled with 2 versions of Delphi:
        <br>
        <ul>
          <li>Delphi 10.3.3 (RIO) Professional. (Community Edition) </li>
          <li>Delphi 10.4 (SYDNEY) Professional</li>
        </ul>
				<br><br>
				The user should be familiar with basic Delphi:
					compilation of applications, packages,
					instalattion of the custom components, and setting up Delphi parameters.
        <p>
      </td>
    </tr>
		<tr>
			<td valign="top" align="right"></td>
			<td align="right"><a HREF="#OVERVIEW">Overview</a><br></td>
		</tr>
    <tr>
      <td valign="top" align="right"><a name="SC"><em><strong>Source Code</strong></em></a></td>
		  <td style="background-color:#dddddd;"> </td>
    </tr>
    <tr>
		  <td></td>
      <td>
				<i>CPRChart</i> source code consists of two parts - <i>CPRS Packages</i> and <i>CPRS GUI</i>.<br>
				<i>CPRS Packages</i> are components developed in Delphi specifically for <i>CPRS</i>
				graphical user interface.<br><br>
        <em><strong>GUI</strong></em>
				The source code of <i>WV-CPRSv3-16 GUI</i> is the result of merging VA CPRS GUI v30c (VistA patch OR*3.0*404) into WVEHR3v2-16.
				The source code of the WVEHR3v2-16 was updated with several enhancements and bug fixes.<br><br>
        <em><strong>CPRS Packages</strong></em>
        While the source code of <i>CPRSChart GUI</i> is changing significantly with every version of the application the
        <i>Packages</i> code is typically backward compatible.
        In preparation of <i>VW-CPRSv3-16</i> we used source code of <i>CPRS Packages v31b</i>.
        You may replace the packages source with the version of </i>30c</i> if prefer to use code 100% compatible with VA CPRS GUI v30c.
		    (Usage of <i>CPRS Packages 30c</i> with <i> WV-CPRSv3-16 GUI</i> is not included in this document)
<p>
				<table>
					<tr>
						<td>NOTE:</td>
						<td>Not all packages included in <i>Packages v31b</i> suite are required
				        for compilation of <i>VW-CPRSv3-16</i>
			      </td>
		      </tr>
	      </table>
			  </p>
      </td>
    </tr>
		<tr>
			<td valign="top" align="right"></td>
			<td align="right"><a HREF="#OVERVIEW">Overview</a><br></td>
		</tr>

  <tr>
	  <td valign="top" align="right"><a name="IDE"><em><strong>IDE Setup Step-by-step</strong></em></a></td>
	  <td style="background-color:#dddddd;"> </td>
  </tr>
  <tr>
    <td align="right" valign="top"><em><strong></strong></em> </td>
    <td>
      <em><strong>Before you begin:</strong></em></p>
      It is common to use Delphi for development of several applications using
			the same set of component libraries.<br><br>
			In case you need to work with different versions of the same library
			you will need to control what version of packages Delphi IDE should use.
      <br><br>
		  Delphi resolve this issue by use of IDE command line <i>-r</i> switch.
			The switch value identifies Windows registry key that contains parameters of the IDE at startup.
			<br><br>
			The next image illustrates the use of <i>-r</i> switch to start IDE.
			The switch value is set to <i>WorldVistA</i>:<br><br>
      <img src="ReadMe\IDEShortcut.PNG"/>
			<br><br>
				<table>
					<tr valign="top">
						<td>NOTE:</td>
						<td>The icon image was also changed - as the reminder of the special IDE settings.</td>
			</tr>
		</table>
    <a href="http://docwiki.embarcadero.com/RADStudio/Sydney/en/IDE_Command_Line_Switches_and_Options">
		More about Delphi Command Line switches and options</a><br><br>
		<em><strong>1. Removing previous versions of packages</strong></em><br><br>
				To review packages installed in IDE:
				<p>
					<ul>
						<li> Close project opened in IDE with <i>"File|Close All"</i> command of Delphi main menu
						<li> Open packages dialog with <i>"Components|Install Packages..."</i> command of main menu.
						<li> Verify if there are previous versions of CPRS packages installed.
					  <li> Use "Remove..." button to remove a package
					</ul>
				<p>
			<img src="ReadMe\InstalledPackages.PNG"/>
			<p>
      <table>
				<tr valign="top">
					<td>NOTE:</td>
					<td> If you compiled packages before and have previous versions of the <i>*.bpl</i> files not listed in the
			"Install Packages" dialog you might need to find and remove them manually.</td>
		</tr>
	</table>
	<p>
	<em><strong>2. Setting environment variables to specify location of the compiled packages</strong></em></p>
      By default Delphi saves results of package compilations in the direcory defined by the environment variable <i>BDSCOMMONDIR</i>.
			Changing the default value allows you to control where the compiled packages and other files required for your project compilation will be placed.<br><br>
			<img src="ReadMe\DelphiEnvironment.PNG"/></a>
	<p>
			To add or modify environment variables:
			<p>
        <ul>
					<li> Opent IDE options dialog with <i>"Tools|Options..."</i> command of Delphi main menu.
					<li> Use "New..."or "Edit..." buttons to open variable editor
				</ul>
 		 <p><img src="ReadMe\EditVariable.PNG"/></a>
      <p>
      <em><strong>3. Updating Delphi Options</strong></em></p>
      Use the environment variable created in step 2 in fields <i>Package output directory</i>, <i>DCP output directory</i>:
			<p>
			<p>
			<img src="ReadMe\DelphiOptionsLibrary.PNG"/></a>
			<p>
      Don't forget to select the correct Compilation Platform <i>Windows 32-bit</i>!
			<p>
				<table>
					<tr valign="top">
						<td>NOTE:</td>
						<td>
    	 CPRS Packages v31b are configured to use <i>pre-</i> and <i>post-</i> build events:
 	    <i>pre-</i> build event creates a <i>Resource</i> directory.
		  <i>post-</i> build event copies <i>.dec, .dfm</i> files to the <i>Resource</i> directory. <p>
      </td></tr>
          <tr>
						<td/>
						<td>Fields <i>Package output directory</i>, <i>DCP output directory</i> set in <i>Options</i>
							dialog are used by IDE for compilation of ALL packages.
							Keep it in mind when compiling libraries other then <i>CPRS_Packages</I>
		   </table>
      <p>
				Add variabels to <i>Library Path</i> and <i>Browsing Path</i><p>
      <p>
 		  <img src="ReadMe\DelphiOptionsLibraryDirectories.PNG"/></a></p>
			<table>
				<tr valign="top">
					<td>NOTE:</td>
					<td>You need to add reference on <i>Resource</i> location to both <i>Library Path</i> and <i>Browsing Path</i> lists
				</td>
			</tr>
		</table>
<p>
	    <em><strong>4. Save options and restart Delphi IDE</strong></em></p>
<p>
	    After restart Delphi will offer to add new environment to existing set - confirm this change.<p>
      Now it's time to open Package Group containing source code of the CPRS packages.<p>
    </td>
  </tr>
	<tr>
		<td valign="top" align="right"></td>
		<td align="right"><a HREF="#OVERVIEW">Overview</a><br></td>
	</tr>
  <tr>
	  <td valign="top" align="right"><a name="PC"><em><strong>Packages Compilation</strong></em></a></td>
	  <td style="background-color:#dddddd;"> </td>
  </tr>
  <tr>
    <td align="right" valign="top"></td>
    <td >
			<em><strong>CPRS Packages v31b Project Source</strong></em></p>
			<i>GUI</i> and <i>Packages</i> must be compiled with the same version of Delphi.
			Original CPRS GUI v31b was compiled with Dephi XE8. That is why the package names include a reference compiler version.
			<p>
			The source code of <i>CPRS Packages</i> is kept in the <i>CPRS_Packages_31b</i> directory.	Location and short description of the individual packages:
				<table width="100%" border="0">
					<tr><td colspan=2><strong></strong><p></td></tr>
					<tr>
						<td width="20%"><b>Package</b></td>
						<td><b>Directory</b></td>
						<td><b>Type</b></td>
						<td><b>Comment</b></td>
					</tr>
					<tr valign="top">
						<td>VAShared_RXE8</td>
						<td>VA</td>
						<TD>Run Time</td>
						<td>General utilities. Required for compilation of packages VA508Access_DXE8, ORCtrls_DXE8, PKI_RXE8</TD>
					</tr>
					<tr valign="top">
						<td>XWB_RXE8</td>
						<td>Broker</td>
						<TD>Run Time</td>
						<td>RPC Broker run time package. Provides access to Server. Required for compilation of packages XWB_DXE8, PKI_RXE8</TD>
					</tr>
					<tr valign="top">
						<td>PKI_RXE8</td>
						<td>PKI</td>
						<TD>Run Time</td>
						<td>Encription related code</TD>
					</tr>
					<tr valign="top">
						<td>ExceptionLogger_RXE8</td>
						<td>PKI</td>
						<TD>Run Time</td>
						<td>Application Exception logger - used to log details of the exceptions.</TD>
					</tr>
					<tr valign="top">
						<td>Borland_DXE8</td>
						<td>Borland</td>
						<TD>Design Time</td>
						<td>Component package. Required for CPRS GUI compilation</TD>
					</tr>
					<tr valign="top">
						<td>CopyPaste_DXE8</td>
						<td>CopyPaste</td>
						<TD>Design Time</td>
						<td>CopyPaste tracking components.</TD>
					</tr>
					<tr valign="top">
						<td>XWB_DXE8</td>
						<td>Broker</td>
						<TD>Design Time</td>
						<td>RPC Broker design time components. Provides access to Server. Required for CPRS GUI compilation</TD>
					</tr>
					<tr valign="top">
						<td>VA508Access_DXE8</td>
						<td>508</td>
						<TD>Design Time</td>
						<td>JAWS support. Required for CPRS GUI compilation</TD>
					</tr>
					<tr valign="top">
						<td>ORCtrls_DXE8</td>
						<td>OR</td>
						<TD>Design Time</td>
						<td>GUI Components. Required for CPRS GUI compilation</TD>
					</tr>
					<tr valign="top">
						<td>FMDC_DXE8</td>
						<td>FilemanComponents</td>
						<TD>Design Time</td>
						<td>FileMan Delphi Components. Provides access to VistA FileMan files. Not Required for CPRS GUI compilation</TD>
					</tr>
				</table>
      <p>
				<table>
					<tr valign="top"><td>NOTE:</td>
            <td>
			Packages <i>CopyPaste_DXE8, FMDC_DXE8</i> are not required for compilation of EHR 3.1 Ver 3-16.
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<p>
			The code of packages XWB_RXE8, XWB_DXE8 is similar to the VA released </i>RPC Broker</i>
			package (VistA patch XWB*1.1*65).
			If you have Broker Patch 65 installed you can use it and ignore installation of the version included in <i>CPRS_Packages_31b</i> suite.
		</td>
	</tr>
</table>
			<p>To compile code with Delphi 10.4 several constant definitions of the package PKI
				file <i>wcrypt2.pas </i> should be updated with the references to the type.
			<p>For example, line 18054 requires a reference to the type <strong>LPCSTR</strong>:
<table>
	<tr>
		<td>
      Original code :
		</td>
		<td>
				REVOCATION_OID_CRL_REVOCATION = LPCSTR('1');
		</td>
  </tr>
	<tr>
			<td>Modified:
			<td>REVOCATION_OID_CRL_REVOCATION<strong>:LPCSTR</strong> = LPCSTR('1');
   </tr>
 </table>
	<p>Similar changes should be applied to the next lines of file <i>wcrypt2.pas </i>:
				<ul>
					<li>18054
					<li>18344..18355
					<li> 19409..19411, 19414, 19417, 19420
				</ul>
			<p>Compilation steps are straightforward:
			<p>
			<em><strong>1. Open package group <i>CPRS_Packages_XE8</i></strong></em>
			<p><img src="ReadMe\_CPRSPackages31bLight.png"/>
			<p>
      <em><strong>2. Rebuild packages starting from the top of the list.</strong></em><br>
	    <em><strong>3. Install Design-time packages after the build.</strong></em>
			<p>
				To verify if the components are now available restart Delphi, open CPRS GUI project, and review the component palette.
			<p>
    </td>
  </tr>
	<tr>
		<td valign="top" align="right"></td>
		<td align="right"><a HREF="#OVERVIEW">Overview</a><br></td>
	</tr>
  <tr>
	  <td valign="top" align="right"><a name="PD"><em><strong>GUI Project Details</strong></em></a>     </td>
	  <td style="background-color:#dddddd;"> </td>
  </tr>
  <tr>
    <td align="right" valign="top"></td>
    <td >
      <i>CPRS GUI</i> project file <i>CPRSChart.dpr</i> is located in CPRS directory.
			<p>Compiled untits will be placed in "CPRS\DCU" directory while executable file will be kept in "CPRS" directory.
			<p>
			This is the <i>WV-CPRSv3-16</i> project tree:
			<p>
      <img src="ReadMe\_GUIProjectLight.png"/>
			<p>
	    Project file compiles as any other Delphi application. The rest of this section
			describes differences made to the application.
			<p>
		  The <i>WV-CPRSv3-16</i> project was built as an enhancement of the WVEHR3v2-16 and utilizes most of its code.<br>
    	Source code of the WVEHR3v2-16 is kept in the folder <i>CPRS-Chart-WVEHR3v2-16</i>.
	    Files in this folder were updated to match compiler requirements as definitions of some Delphi 10.3 constants were changed.
			Even if the files were not used in the WV-CPRSv3-16 they were retained in the folder.
			For example, the original project file <i>CPRSChart.dpr</i> still resides in <i>CPRS-Chart-WVEHR3v2-16</i> folder.
			(And could be used to recompile WVEHR3v2-16 GUI with the Delphi 10.3).
		  <p>
			Files introduced in <i>WV-CPRSv3-16</i> were placed in the <i>WVEHR</i> folder.
			<p>
  	  <strong>Changes to the project options file <i>CPRSChart.dproj</i>:</strong><p>
      <ul>
				<li>Direct references on files included in CPRS packages was removed from the project</li>
        <li>Project version updated
			</ul>
			Two conditional symbols were added:<br>
		  <UL>
			  <li>CCOW - identifies code required to support CCOW functionality
			  <li>WORLDVISTA - code that was introduced by WorldVistA
		  </UL>
			<table>
				<tr valign="top">
					<td>NOTE:</td>
					<td>
		        By default only WORLDVISTA symbol is defined in the project and thus the CCOW functionality is disabled.
          </td></tr>
			</table>
			<p>
			<strong>Changes to the project file <i>CPRSChart.dpr</i>:</strong><p>
			<ul>
		    <li>Location of the WorldVistA files was changed - files are placed in <i>WVEHR</i> directory</li>
		    <li>Code updated: connection Verificaton if the application is being updated while GUI is starting was disabled</li>
        <li>Connection and application context creation moved from the <i>fFrame</i> unit to the project file
        <li>List of the files included in the project was changed
			</ul>
  		<p>
			<table border="0">
				<tr>
				<td colspan=2><strong>Files removed from the project <i>CPRSChart.dpr</i>:
				</strong></td>
				</tr>
				<tr>
  				<td width="20%"><b>File</b></td>
	  			<td><b>Comment</b></td>
				</tr>
	  		<TR><td>  VERGENCECONTEXTORLib_TLB</td><td>Replaced with the one of Broker package</td></TR>
		  	<TR><td>  fxBroker</td><td>Replaced with fEventLog</td></TR>
			  <TR><td>  fxServer</td><td>Replaced with fEventLog</td></TR>
			  <TR><td>  fAbout</td><td>Replaced with 'WVEHR\fAbout.pas'</td></TR>
			  <TR><td>  fSplash</td><td>Replaced with 'WVEHR\fAbout.pas'</td></TR>
				<tr><td colspan=2><p>
	  				<strong>Files included in the project <i>CPRSChart.dpr</i> when conditional WORLDVISTA is defined:</strong><p>
   				</td></tr>
				<tr>
			  	<td width="20%"><b>File</b></td>
				  <td><b>Comment</b></td>
				</tr>
			  <TR><td>  fVW_Alerts.pas</td><td>Replacement of <i>fAlerts</i></td></TR>
			  <TR><td>  fVW_DupPts.pas</td><td>Replacement of <i>fDupPts</i></td></TR>
			  <TR><td>  fVW_PtSelDemog.pas</td><td>Replacement of <i>fPtSelDemog</i></td></TR>
			  <TR><td>  fVW_PtSelect.pas</td><td>Replacement of <i>fPtSel</i></td></TR>
			  <TR><td>  fVW_PtSelOptns.pas</td><td>Replacement of <i>fPtSelOpt</i></td></TR>
			  <TR><td>  uVW_PtSelect.pas</td><td></td></TR>
			  <TR><td>  uVW_Utils.pas</td><td></td></TR>
			  <TR><td>  fVW_PtSelOptSave.pas</td><td>Replacement of <i>fPtSelOptSave</i></td></TR>
        <tr><td colspan=2><p>
			      <strong>Files included in the project <i>CPRSChart.dpr</i> when conditional WORLDVISTA is <i>undefined</i>:</strong><p>
			    </td>
				</TR>
				<tr>
					<td width="20%"><b>File</b></td>
					<td><b>Comment</b></td>
				</tr>
  			<TR><td>  fPtSens</td><td></td></TR>
	  		<TR><td>  fPtSel</td><td>Replaced with 'WVEHR\PatientSelector\fVW_PtSelect.pas' </td></TR>
		  	<TR><td>  fPtSelDemog</td><td>Replaced with 'WVEHR\PatientSelector\fVW_PtSelDemog.pas'</td></TR>
			  <TR><td>  fPtSelOptns</td><td>Replaced with 'WVEHR\PatientSelector\fVW_PtSelOptns.pas' </td></TR>
			  <TR><td>  fPtSelOptSave</td><td>Replaced with 'WVEHR\PatientSelector\fVW_PtSelOptSave.pas' </td></TR>
			  <TR><td>  fDupPts</td><td>Replaced with 'WVEHR\PatientSelector\fVW_DupPts.pas'</td></TR>
				<tr><td colspan=2><p>
				<strong>Files added to the project <i>CPRSChart.dpr</i>:</strong>
			</td>
		</TR>
	  		<tr>
		    	<td width="20%"><b>File</b></td>
			    <td><b>Comment</b></td>
  			</tr>
		  	<TR>
			  	<td valign="top"> WVEHR\fFrame.pas</td><td>Replacement of the original <i>fFrame</i> unit. Changes: <br>
            <ul>
	            <li>CCOW code isolated by conditional statements
	            <li>version validation moved out to separate unit
            </ul>
				  </td>
				</TR>
			  <TR><td> WVEHR\VW\rVWEHR.pas,</td><td></td></TR>
			  <TR><td> WVEHR\Tools\uVersionCompare.pas,</td><td></td></TR>
			  <TR><td> WVEHR\VW\frmEPrescribe.pas</td><td></td></TR>
			  <TR><td> WVEHR\EventLog\fEventLog.pas</td><td>RPC Log replacement</td></TR>
			  <TR><td> WVEHR\EventLog\uGN_RPCLog.pas</td><td>RPC Log utilities</td></TR>
			  <TR><td> WVEHR\fAbout.pas</td><td></td></TR>
			  <TR><td> WVEHR\Tools\uVW_Size.pas</td><td></td></TR>
			  <TR><td> WVEHR\uChangeLog.pas</td><td></td></TR>
				<tr><td  colspan=2><p>
     <strong>Changes to the original <i>.pas</i> files</strong>:
		 </td>
	 </TR>
	       <tr>
	         <td width="20%"><b>File</b></td>
	         <td><b>Comment</b></td>
				 </tr>
       	 <tr><td>dShared.pas</td><td>Uses clause updated to avoid compiler warnings</td></tr>
	       <tr><td>fDCSumm.pas</td><td>Compiler conditionals added to control CCOW related code</td></tr>
	       <tr><td>fCover.pas</td><td>Bug fixes</td></tr>
	       <tr><td>fEncnt.pas</td><td>Uses clause cleanup</td></tr>
	       <tr><td>fFrame.pas</td><td>Compiler conditionals added to control CCOW related code.<br>Bugs fixes.</td></tr>
	       <tr><td>fGraps,pas</td><td>WorldVista enhancements</td></tr>
	       <tr><td>fLabs.pas</td><td>WorldVista enhancements. Bugs fixes. Compiler conditionals added to control CCOW related code</td></tr>
        <tr><td>fMeds.pas</td><td>Compiler conditionals added to control CCOW related code. Code formatted</td></tr>
	      <tr><td>fNotes.pas</td><td>Compiler conditionals added to control CCOW related code</td></tr>
      	<tr><td>fProbEdt.pas</td><td>Uses clause cleanup</td></tr>
	      <tr><td>fProbs.pas</td><td>Compiler conditionals added to control CCOW related code</td></tr>
	      <tr><td>fReports.pas</td><td>WorldVista enhancements. Bugs fixes. Compiler conditionals added to control CCOW related code</td></tr>
	      <tr><td>fRprBox.pas</td><td>Compiler conditionals added to control CCOW related code</td></tr>
	      <tr><td>fSurgery.pas</td><td>Compiler conditionals added to control CCOW related code</td></tr>
	      <tr><td>fVitals.pas</td><td>Compiler conditionals added to control CCOW related code</td></tr>
	      <tr><td>rCore.pas</td><td>Code formatted</td></tr>
	      <tr><td>rMisc.pas</td><td>Code enhancement</td></tr>
     	  <tr><td>rReports.pas</td><td>WorldVista enhancements.</td></tr>
	      <tr><td>uInit.pas</td><td>WorldVista enhancements.</td></tr>
	      <tr><td>uProbs.pas</td><td>Uses clause cleanup.</td></tr>
	      <tr><td>uReminders.pas</td><td>Uses clause updated to avoid comiler warnings</td></tr>
	      <tr><td>Consults\fConsults.pas</td><td>Compiler conditionals added to control CCOW related code. Code formatted</td></tr>
	      <tr><td>Orders\fODBase.pas</td><td>Compiler conditionals added to control CCOW related code</td></tr>
	      <tr><td>Orders\fOrders.pas</td><td>Compiler conditionals added to control CCOW related code</td></tr>
	      <tr><td>Orders\fOrdersRelease.pas</td><td>Changed unit name in uses clause from <i>Hash</i> to <i>XWBHash</i></td></tr>
	      <tr><td>Orders\uOrders.pas</td><td>Uses claus updatedCompiler conditionals added to control CCOW related code</td></tr>
   	    <tr><td>Tools\fGN_RPCLog.pas</td><td>WorldVista enhancements.</td></tr>
      </table>
    </td>
  </tr>
	<tr>
		<td valign="top" align="right"></td>
		<td align="right"><a HREF="#OVERVIEW">Overview</a><br></td>
	</tr>
	<tr>
		<td valign="top" align="right"><a name="INFO"><em><strong>Additional Information</strong></em></a></td>
		<td style="background-color:#dddddd;"> </td>
	</tr>
  <tr>
    <td></td>
    <td align="right">
      <table width="100%" border="0">
        <tr>
          <td >Send you questions regaring <i>WorldVistA CPRSChart</i> to </td>
					<td align="right"><a href="mailto:info@worldvista.org?Subject=CPRS3.1-16" target="_top">info@worldvista.org</a></td>
				</tr>
				<tr>
					<td><i>WorldVistA CPRSChart Ver 3-16</i> on GitHub:</td>
					<td align="right"> <a href="">CPRS</a></td>
				</tr>
			  <tr>
				  <td>WorldVistA web site</td>
          <td align="right"><a href="https://WorldVista.org">worldvista.org</a>
</td>
         </tr>
       </table>
    </td>
  </tr>
	<tr>
		<td valign="top" align="right"></td>
		<td align="right"><a HREF="#OVERVIEW"></a><br></td>
	</tr>
	<tr>
		<td valign="top" align="right"><a name="INFO"><em><strong></strong></em></a></td>
		<td align="right" style="background-color:#dddddd;">(c) WorldVistA 2020</td>
	</tr>
</table>
</body>
</html>
