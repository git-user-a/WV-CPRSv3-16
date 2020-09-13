program CPRSChart;
uses
  ShareMem,
  Forms,
  WinHelpViewer,
  ORSystem,
  ORNet,
  ORFn,
  Dialogs,
  fPage in 'CPRS-Chart-WVEHR3v2-16\fPage.pas' {frmPage},
  fHSplit in 'CPRS-Chart-WVEHR3v2-16\fHSplit.pas' {frmHSplit},
  fHP in 'CPRS-Chart-WVEHR3v2-16\fHP.pas' {frmHP},
  fCover in 'CPRS-Chart-WVEHR3v2-16\fCover.pas' {frmCover},
  fMeds in 'CPRS-Chart-WVEHR3v2-16\fMeds.pas' {frmMeds},
  fNotes in 'CPRS-Chart-WVEHR3v2-16\fNotes.pas' {frmNotes},
  fDCSumm in 'CPRS-Chart-WVEHR3v2-16\fDCSumm.pas' {frmDCSumm},
  fLabs in 'CPRS-Chart-WVEHR3v2-16\fLabs.pas' {frmLabs},
  fReports in 'CPRS-Chart-WVEHR3v2-16\fReports.pas' {frmReports},
  uCore in 'CPRS-Chart-WVEHR3v2-16\uCore.pas',
  rCore in 'CPRS-Chart-WVEHR3v2-16\rCore.pas',
  fEncnt in 'CPRS-Chart-WVEHR3v2-16\fEncnt.pas' {frmEncounter},
  fVisit in 'CPRS-Chart-WVEHR3v2-16\fVisit.pas' {frmVisit},
  rTIU in 'CPRS-Chart-WVEHR3v2-16\rTIU.pas',
  fNoteBA in 'CPRS-Chart-WVEHR3v2-16\fNoteBA.pas' {frmNotesByAuthor},
  fNoteBD in 'CPRS-Chart-WVEHR3v2-16\fNoteBD.pas' {frmNotesByDate},
  fLabTest in 'CPRS-Chart-WVEHR3v2-16\fLabTest.pas' {frmLabTest},
  fLabTestGroups in 'CPRS-Chart-WVEHR3v2-16\fLabTestGroups.pas' {frmLabTestGroups},
  fLabTests in 'CPRS-Chart-WVEHR3v2-16\fLabTests.pas' {frmLabTests},
  rLabs in 'CPRS-Chart-WVEHR3v2-16\rLabs.pas',
  fSignItem in 'CPRS-Chart-WVEHR3v2-16\fSignItem.pas' {frmSignItem},
  rCover in 'CPRS-Chart-WVEHR3v2-16\rCover.pas',
  fRptBox in 'CPRS-Chart-WVEHR3v2-16\fRptBox.pas' {frmReportBox},
  rReports in 'CPRS-Chart-WVEHR3v2-16\rReports.pas',
  fProbs in 'CPRS-Chart-WVEHR3v2-16\fProbs.pas' {frmProblems},
  fAutoSz in 'CPRS-Chart-WVEHR3v2-16\fAutoSz.pas' {frmAutoSz},
  rMisc in 'CPRS-Chart-WVEHR3v2-16\rMisc.pas',
  fPtCWAD in 'CPRS-Chart-WVEHR3v2-16\fPtCWAD.pas' {frmPtCWAD},
  rMeds in 'CPRS-Chart-WVEHR3v2-16\rMeds.pas',
  fVitals in 'CPRS-Chart-WVEHR3v2-16\fVitals.pas' {frmVitals},
  uProbs in 'CPRS-Chart-WVEHR3v2-16\uProbs.pas',
  fProbEdt in 'CPRS-Chart-WVEHR3v2-16\fProbEdt.pas' {frmdlgProb},
  fProbFlt in 'CPRS-Chart-WVEHR3v2-16\fProbFlt.pas' {frmPlVuFilt},
  fProbCmt in 'CPRS-Chart-WVEHR3v2-16\fProbCmt.pas' {frmProbCmt},
  fNoteCslt in 'CPRS-Chart-WVEHR3v2-16\fNoteCslt.pas' {frmNoteConsult},
  fNotePrt in 'CPRS-Chart-WVEHR3v2-16\fNotePrt.pas' {frmNotePrint},
  uConst in 'CPRS-Chart-WVEHR3v2-16\uConst.pas',
  fConsults in 'CPRS-Chart-WVEHR3v2-16\Consults\fConsults.pas' {frmConsults},
  fLkUpLocation in 'CPRS-Chart-WVEHR3v2-16\fLkUpLocation.pas' {frmLkUpLocation},
  fRename in 'CPRS-Chart-WVEHR3v2-16\fRename.pas' {frmRename},
  fDateRange in 'CPRS-Chart-WVEHR3v2-16\fDateRange.pas' {frmDateRange},
  fRenewOutMed in 'CPRS-Chart-WVEHR3v2-16\fRenewOutMed.pas' {frmRenewOutMed},
  fConsult513Prt in 'CPRS-Chart-WVEHR3v2-16\Consults\fConsult513Prt.pas' {frm513Print},
  fConsultAct in 'CPRS-Chart-WVEHR3v2-16\Consults\fConsultAct.pas' {frmConsultAction},
  fConsultAlertTo in 'CPRS-Chart-WVEHR3v2-16\Consults\fConsultAlertTo.pas' {frmConsultAlertsTo},
  fConsultBD in 'CPRS-Chart-WVEHR3v2-16\Consults\fConsultBD.pas' {frmConsultsByDate},
  fConsultBS in 'CPRS-Chart-WVEHR3v2-16\Consults\fConsultBS.pas' {frmConsultsByService},
  fConsultBSt in 'CPRS-Chart-WVEHR3v2-16\Consults\fConsultBSt.pas' {frmConsultsByStatus},
  fConsultsView in 'CPRS-Chart-WVEHR3v2-16\Consults\fConsultsView.pas' {frmConsultsView},
  rConsults in 'CPRS-Chart-WVEHR3v2-16\Consults\rConsults.pas',
  uConsults in 'CPRS-Chart-WVEHR3v2-16\Consults\uConsults.pas',
  fTimeout in 'CPRS-Chart-WVEHR3v2-16\fTimeout.pas' {frmTimeout},
  fNoteDR in 'CPRS-Chart-WVEHR3v2-16\fNoteDR.pas' {frmNoteDelReason},
  rDCSumm in 'CPRS-Chart-WVEHR3v2-16\rDCSumm.pas',
  fCsltNote in 'CPRS-Chart-WVEHR3v2-16\Consults\fCsltNote.pas' {frmCsltNote},
  rProbs in 'CPRS-Chart-WVEHR3v2-16\rProbs.pas',
  fEditConsult in 'CPRS-Chart-WVEHR3v2-16\Consults\fEditConsult.pas' {frmEditCslt},
  fEditProc in 'CPRS-Chart-WVEHR3v2-16\Consults\fEditProc.pas' {frmEditProc},
  fAllgyFind in 'CPRS-Chart-WVEHR3v2-16\fAllgyFind.pas' {frmAllgyFind},
  fAddlSigners in 'CPRS-Chart-WVEHR3v2-16\fAddlSigners.pas' {frmAddlSigners},
  fLabPrint in 'CPRS-Chart-WVEHR3v2-16\fLabPrint.pas' {frmLabPrint},
  fReportsPrint in 'CPRS-Chart-WVEHR3v2-16\fReportsPrint.pas' {frmReportPrt},
  fvit in 'CPRS-Chart-WVEHR3v2-16\fvit.pas' {frmVit},
  uPCE in 'CPRS-Chart-WVEHR3v2-16\Encounter\uPCE.pas',
  fEncounterFrame in 'CPRS-Chart-WVEHR3v2-16\Encounter\fEncounterFrame.pas' {frmEncounterFrame},
  fPCEBase in 'CPRS-Chart-WVEHR3v2-16\Encounter\fPCEBase.pas' {frmPCEBase},
  fPCELex in 'CPRS-Chart-WVEHR3v2-16\Encounter\fPCELex.pas' {frmPCELex},
  fPCEOther in 'CPRS-Chart-WVEHR3v2-16\Encounter\fPCEOther.pas' {frmPCEOther},
  fProcedure in 'CPRS-Chart-WVEHR3v2-16\Encounter\fProcedure.pas' {frmProcedures},
  fSkinTest in 'CPRS-Chart-WVEHR3v2-16\Encounter\fSkinTest.pas' {frmSkinTests},
  fVisitType in 'CPRS-Chart-WVEHR3v2-16\Encounter\fVisitType.pas' {frmVisitType},
  rPCE in 'CPRS-Chart-WVEHR3v2-16\Encounter\rPCE.pas',
  fDiagnoses in 'CPRS-Chart-WVEHR3v2-16\Encounter\fDiagnoses.pas' {frmDiagnoses},
  fPatientEd in 'CPRS-Chart-WVEHR3v2-16\Encounter\fPatientEd.pas' {frmPatientEd},
  fExam in 'CPRS-Chart-WVEHR3v2-16\Encounter\fExam.pas' {frmExams},
  fHealthFactor in 'CPRS-Chart-WVEHR3v2-16\Encounter\fHealthFactor.pas' {frmHealthFactors},
  fImmunization in 'CPRS-Chart-WVEHR3v2-16\Encounter\fImmunization.pas' {frmImmunizations},
  fEncVitals in 'CPRS-Chart-WVEHR3v2-16\Encounter\fEncVitals.pas' {frmEncVitals},
  fEffectDate in 'CPRS-Chart-WVEHR3v2-16\fEffectDate.pas' {frmEffectDate},
  uInit in 'CPRS-Chart-WVEHR3v2-16\uInit.pas',
  dShared in 'CPRS-Chart-WVEHR3v2-16\dShared.pas' {dmodShared: TDataModule},
  fDrawers in 'CPRS-Chart-WVEHR3v2-16\fDrawers.pas' {frmDrawers},
  fMedCopy in 'CPRS-Chart-WVEHR3v2-16\fMedCopy.pas' {frmMedCopy},
  uReminders in 'CPRS-Chart-WVEHR3v2-16\uReminders.pas',
  rReminders in 'CPRS-Chart-WVEHR3v2-16\rReminders.pas',
  fReminderTree in 'CPRS-Chart-WVEHR3v2-16\fReminderTree.pas' {frmReminderTree},
  fReminderDialog in 'CPRS-Chart-WVEHR3v2-16\fReminderDialog.pas' {frmRemDlg},
  fReportsAdhocSubItem1 in 'CPRS-Chart-WVEHR3v2-16\fReportsAdhocSubItem1.pas' {frmReportsAdhocSubItem1},
  fReportsAdhocComponent1 in 'CPRS-Chart-WVEHR3v2-16\fReportsAdhocComponent1.pas' {frmReportsAdhocComponent1},
  fMHTest in 'CPRS-Chart-WVEHR3v2-16\fMHTest.pas' {frmMHTest},
  fGAF in 'CPRS-Chart-WVEHR3v2-16\Encounter\fGAF.pas' {frmGAF},
  fPCEProvider in 'CPRS-Chart-WVEHR3v2-16\Encounter\fPCEProvider.pas' {frmPCEProvider},
  fPCEBaseGrid in 'CPRS-Chart-WVEHR3v2-16\Encounter\fPCEBaseGrid.pas' {frmPCEBaseGrid},
  fPCEBaseMain in 'CPRS-Chart-WVEHR3v2-16\Encounter\fPCEBaseMain.pas' {frmPCEBaseMain},
  fNoteProps in 'CPRS-Chart-WVEHR3v2-16\fNoteProps.pas' {frmNoteProperties},
  fNotesBP in 'CPRS-Chart-WVEHR3v2-16\fNotesBP.pas' {frmNotesBP},
  fLabInfo in 'CPRS-Chart-WVEHR3v2-16\fLabInfo.pas' {frmLabInfo},
  fPreReq in 'CPRS-Chart-WVEHR3v2-16\Consults\fPreReq.pas' {frmPrerequisites},
  fDCSummProps in 'CPRS-Chart-WVEHR3v2-16\fDCSummProps.pas' {frmDCSummProperties},
  fHFSearch in 'CPRS-Chart-WVEHR3v2-16\Encounter\fHFSearch.pas' {frmHFSearch},
  fConsMedRslt in 'CPRS-Chart-WVEHR3v2-16\Consults\fConsMedRslt.pas' {frmConsMedRslt},
  uVitals in 'CPRS-Chart-WVEHR3v2-16\Vitals\uVitals.pas',
  rVitals in 'CPRS-Chart-WVEHR3v2-16\Vitals\rVitals.pas',
  uDCSumm in 'CPRS-Chart-WVEHR3v2-16\uDCSumm.pas',
  uDocTree in 'CPRS-Chart-WVEHR3v2-16\uDocTree.pas',
  fVitalsDate in 'CPRS-Chart-WVEHR3v2-16\Vitals\fVitalsDate.pas' {frmVitalsDate},
  uTemplates in 'CPRS-Chart-WVEHR3v2-16\Templates\uTemplates.pas',
  fTemplateDialog in 'CPRS-Chart-WVEHR3v2-16\Templates\fTemplateDialog.pas' {frmTemplateDialog},
  fTemplateEditor in 'CPRS-Chart-WVEHR3v2-16\Templates\fTemplateEditor.pas' {frmTemplateEditor},
  fTemplateFieldEditor in 'CPRS-Chart-WVEHR3v2-16\Templates\fTemplateFieldEditor.pas' {frmTemplateFieldEditor},
  fTemplateFields in 'CPRS-Chart-WVEHR3v2-16\Templates\fTemplateFields.pas' {frmTemplateFields},
  fTemplateObjects in 'CPRS-Chart-WVEHR3v2-16\Templates\fTemplateObjects.pas' {frmTemplateObjects},
  fTemplateView in 'CPRS-Chart-WVEHR3v2-16\Templates\fTemplateView.pas' {frmTemplateView},
  mTemplateFieldButton in 'CPRS-Chart-WVEHR3v2-16\Templates\mTemplateFieldButton.pas' {fraTemplateFieldButton: TFrame},
  rTemplates in 'CPRS-Chart-WVEHR3v2-16\Templates\rTemplates.pas',
  uTemplateFields in 'CPRS-Chart-WVEHR3v2-16\Templates\uTemplateFields.pas',
  fTemplateAutoGen in 'CPRS-Chart-WVEHR3v2-16\Templates\fTemplateAutoGen.pas' {frmTemplateAutoGen},
  mVisitRelated in 'CPRS-Chart-WVEHR3v2-16\Encounter\mVisitRelated.pas' {fraVisitRelated: TFrame},
  fRemVisitInfo in 'CPRS-Chart-WVEHR3v2-16\fRemVisitInfo.pas' {frmRemVisitInfo},
  fIconLegend in 'CPRS-Chart-WVEHR3v2-16\fIconLegend.pas' {frmIconLegend},
  fTemplateImport in 'CPRS-Chart-WVEHR3v2-16\Templates\fTemplateImport.pas' {frmTemplateImport},
  fRemCoverSheet in 'CPRS-Chart-WVEHR3v2-16\fRemCoverSheet.pas' {frmRemCoverSheet},
  uTIU in 'CPRS-Chart-WVEHR3v2-16\uTIU.pas',
  fRemCoverPreview in 'CPRS-Chart-WVEHR3v2-16\fRemCoverPreview.pas' {frmRemCoverPreview},
  fPCEEdit in 'CPRS-Chart-WVEHR3v2-16\Encounter\fPCEEdit.pas' {frmPCEEdit},
  uSurgery in 'CPRS-Chart-WVEHR3v2-16\uSurgery.pas',
  fSurgeryView in 'CPRS-Chart-WVEHR3v2-16\fSurgeryView.pas' {frmSurgeryView},
  rSurgery in 'CPRS-Chart-WVEHR3v2-16\rSurgery.pas',
  uCaseTree in 'CPRS-Chart-WVEHR3v2-16\uCaseTree.pas',
  fSurgery in 'CPRS-Chart-WVEHR3v2-16\fSurgery.pas' {frmSurgery},
  fNoteIDParents in 'CPRS-Chart-WVEHR3v2-16\fNoteIDParents.pas' {frmNoteIDParents},
  uReports in 'CPRS-Chart-WVEHR3v2-16\uReports.pas',
  fNoteCPFields in 'CPRS-Chart-WVEHR3v2-16\fNoteCPFields.pas' {frmNoteCPFields},
  CPRSChart_TLB in 'CPRS-Chart-WVEHR3v2-16\CPRSChart_TLB.pas',
  uEventHooks in 'CPRS-Chart-WVEHR3v2-16\uEventHooks.pas',
  rEventHooks in 'CPRS-Chart-WVEHR3v2-16\rEventHooks.pas',
  uOrders in 'CPRS-Chart-WVEHR3v2-16\Orders\uOrders.pas',
  fOCSession in 'CPRS-Chart-WVEHR3v2-16\Orders\fOCSession.pas' {frmOCSession},
  fODAuto in 'CPRS-Chart-WVEHR3v2-16\Orders\fODAuto.pas',
  fODBase in 'CPRS-Chart-WVEHR3v2-16\Orders\fODBase.pas' {frmODBase},
  fODDiet in 'CPRS-Chart-WVEHR3v2-16\Orders\fODDiet.pas' {frmODDiet},
  fODDietLT in 'CPRS-Chart-WVEHR3v2-16\Orders\fODDietLT.pas' {frmODDietLT},
  fODGen in 'CPRS-Chart-WVEHR3v2-16\Orders\fODGen.pas' {frmODGen},
  fODLab in 'CPRS-Chart-WVEHR3v2-16\Orders\fODLab.pas' {frmODLab},
  fODLabImmedColl in 'CPRS-Chart-WVEHR3v2-16\Orders\fODLabImmedColl.pas' {frmODLabImmedColl},
  fODLabOthCollSamp in 'CPRS-Chart-WVEHR3v2-16\Orders\fODLabOthCollSamp.pas' {frmODLabOthCollSamp},
  fODLabOthSpec in 'CPRS-Chart-WVEHR3v2-16\Orders\fODLabOthSpec.pas' {frmODLabOthSpec},
  fODMedComplex in 'CPRS-Chart-WVEHR3v2-16\Orders\fODMedComplex.pas' {frmODMedComplex},
  fODMedFA in 'CPRS-Chart-WVEHR3v2-16\Orders\fODMedFA.pas' {frmODMedFA},
  fODMedIn in 'CPRS-Chart-WVEHR3v2-16\Orders\fODMedIn.pas' {frmODMedIn},
  fODMedIV in 'CPRS-Chart-WVEHR3v2-16\Orders\fODMedIV.pas' {frmODMedIV},
  fODMedOIFA in 'CPRS-Chart-WVEHR3v2-16\Orders\fODMedOIFA.pas' {frmODMedOIFA},
  fODMedOut in 'CPRS-Chart-WVEHR3v2-16\Orders\fODMedOut.pas' {frmODMedOut},
  fODMeds in 'CPRS-Chart-WVEHR3v2-16\Orders\fODMeds.pas' {frmODMeds},
  fODMessage in 'CPRS-Chart-WVEHR3v2-16\Orders\fODMessage.pas' {frmODMessage},
  fODMisc in 'CPRS-Chart-WVEHR3v2-16\Orders\fODMisc.pas' {frmODMisc},
  fODRad in 'CPRS-Chart-WVEHR3v2-16\Orders\fODRad.pas' {frmODRad},
  fODRadApproval in 'CPRS-Chart-WVEHR3v2-16\Orders\fODRadApproval.pas' {frmODRadApproval},
  fODRadConShRes in 'CPRS-Chart-WVEHR3v2-16\Orders\fODRadConShRes.pas' {frmODRadConShRes},
  fODRadImType in 'CPRS-Chart-WVEHR3v2-16\Orders\fODRadImType.pas' {frmODRadImType},
  fODSaveQuick in 'CPRS-Chart-WVEHR3v2-16\Orders\fODSaveQuick.pas' {frmODQuick},
  fODText in 'CPRS-Chart-WVEHR3v2-16\Orders\fODText.pas' {frmODText},
  fODVitals in 'CPRS-Chart-WVEHR3v2-16\Orders\fODVitals.pas' {frmODVitals},
  fOMAction in 'CPRS-Chart-WVEHR3v2-16\Orders\fOMAction.pas' {frmOMAction},
  fOMHTML in 'CPRS-Chart-WVEHR3v2-16\Orders\fOMHTML.pas' {frmOMHTML},
  fOMNavA in 'CPRS-Chart-WVEHR3v2-16\Orders\fOMNavA.pas' {frmOMNavA},
  fOMProgress in 'CPRS-Chart-WVEHR3v2-16\Orders\fOMProgress.pas' {frmOMProgress},
  fOMSet in 'CPRS-Chart-WVEHR3v2-16\Orders\fOMSet.pas' {frmOMSet},
  fOMVerify in 'CPRS-Chart-WVEHR3v2-16\Orders\fOMVerify.pas' {frmOMVerify},
  fOrderComment in 'CPRS-Chart-WVEHR3v2-16\Orders\fOrderComment.pas' {frmWardComments},
  fOrderFlag in 'CPRS-Chart-WVEHR3v2-16\Orders\fOrderFlag.pas' {frmFlagOrder},
  fOrders in 'CPRS-Chart-WVEHR3v2-16\Orders\fOrders.pas' {frmOrders},
  fOrdersAlert in 'CPRS-Chart-WVEHR3v2-16\Orders\fOrdersAlert.pas' {frmAlertOrders},
  fOrderSaveQuick in 'CPRS-Chart-WVEHR3v2-16\Orders\fOrderSaveQuick.pas' {frmSaveQuickOrder},
  fOrdersComplete in 'CPRS-Chart-WVEHR3v2-16\Orders\fOrdersComplete.pas' {frmCompleteOrders},
  fOrdersCopy in 'CPRS-Chart-WVEHR3v2-16\Orders\fOrdersCopy.pas' {frmCopyOrders},
  fOrdersDC in 'CPRS-Chart-WVEHR3v2-16\Orders\fOrdersDC.pas' {frmDCOrders},
  fOrdersHold in 'CPRS-Chart-WVEHR3v2-16\Orders\fOrdersHold.pas' {frmHoldOrders},
  fOrdersOnChart in 'CPRS-Chart-WVEHR3v2-16\Orders\fOrdersOnChart.pas' {frmOnChartOrders},
  fOrdersPrint in 'CPRS-Chart-WVEHR3v2-16\Orders\fOrdersPrint.pas' {frmOrdersPrint},
  fOrdersRefill in 'CPRS-Chart-WVEHR3v2-16\Orders\fOrdersRefill.pas' {frmRefillOrders},
  fOrdersRelease in 'CPRS-Chart-WVEHR3v2-16\Orders\fOrdersRelease.pas' {frmReleaseOrders},
  fOrdersRenew in 'CPRS-Chart-WVEHR3v2-16\Orders\fOrdersRenew.pas' {frmRenewOrders},
  fOrdersSign in 'CPRS-Chart-WVEHR3v2-16\Orders\fOrdersSign.pas' {frmSignOrders},
  fOrdersTS in 'CPRS-Chart-WVEHR3v2-16\Orders\fOrdersTS.pas' {frmOrdersTS},
  fOrdersUnhold in 'CPRS-Chart-WVEHR3v2-16\Orders\fOrdersUnhold.pas' {frmUnholdOrders},
  fOrdersVerify in 'CPRS-Chart-WVEHR3v2-16\Orders\fOrdersVerify.pas' {frmVerifyOrders},
  fOrderUnflag in 'CPRS-Chart-WVEHR3v2-16\Orders\fOrderUnflag.pas' {frmUnflagOrder},
  fOrderVw in 'CPRS-Chart-WVEHR3v2-16\Orders\fOrderVw.pas' {frmOrderView},
  rODAllergy in 'CPRS-Chart-WVEHR3v2-16\Orders\rODAllergy.pas',
  rODBase in 'CPRS-Chart-WVEHR3v2-16\Orders\rODBase.pas',
  rODDiet in 'CPRS-Chart-WVEHR3v2-16\Orders\rODDiet.pas',
  rODLab in 'CPRS-Chart-WVEHR3v2-16\Orders\rODLab.pas',
  rODMeds in 'CPRS-Chart-WVEHR3v2-16\Orders\rODMeds.pas',
  rODRad in 'CPRS-Chart-WVEHR3v2-16\Orders\rODRad.pas',
  rOrders in 'CPRS-Chart-WVEHR3v2-16\Orders\rOrders.pas',
  uODBase in 'CPRS-Chart-WVEHR3v2-16\Orders\uODBase.pas',
  fOCAccept in 'CPRS-Chart-WVEHR3v2-16\Orders\fOCAccept.pas' {frmOCAccept},
  fODConsult in 'CPRS-Chart-WVEHR3v2-16\Consults\fODConsult.pas' {frmODCslt},
  fODProc in 'CPRS-Chart-WVEHR3v2-16\Consults\fODProc.pas' {frmODProc},
  uOptions in 'CPRS-Chart-WVEHR3v2-16\Options\uOptions.pas',
  fOptionsCombinations in 'CPRS-Chart-WVEHR3v2-16\Options\fOptionsCombinations.pas' {frmOptionsCombinations},
  fOptionsDays in 'CPRS-Chart-WVEHR3v2-16\Options\fOptionsDays.pas' {frmOptionsDays},
  fOptionsLists in 'CPRS-Chart-WVEHR3v2-16\Options\fOptionsLists.pas' {frmOptionsLists},
  fOptionsNewList in 'CPRS-Chart-WVEHR3v2-16\Options\fOptionsNewList.pas' {frmOptionsNewList},
  fOptionsNotes in 'CPRS-Chart-WVEHR3v2-16\Options\fOptionsNotes.pas' {frmOptionsNotes},
  fOptionsOther in 'CPRS-Chart-WVEHR3v2-16\Options\fOptionsOther.pas' {frmOptionsOther},
  fOptionsPatientSelection in 'CPRS-Chart-WVEHR3v2-16\Options\fOptionsPatientSelection.pas' {frmOptionsPatientSelection},
  fOptionsPrimaryList in 'CPRS-Chart-WVEHR3v2-16\Options\fOptionsPrimaryList.pas' {frmOptionsPrimaryList},
  fOptionsReminders in 'CPRS-Chart-WVEHR3v2-16\Options\fOptionsReminders.pas' {frmOptionsReminders},
  fOptionsReportsCustom in 'CPRS-Chart-WVEHR3v2-16\Options\fOptionsReportsCustom.pas' {frmOptionsReportsCustom},
  fOptionsReportsDefault in 'CPRS-Chart-WVEHR3v2-16\Options\fOptionsReportsDefault.pas' {frmOptionsReportsDefault},
  fOptionsSubscribe in 'CPRS-Chart-WVEHR3v2-16\Options\fOptionsSubscribe.pas' {frmOptionsSubscribe},
  fOptionsSurrogate in 'CPRS-Chart-WVEHR3v2-16\Options\fOptionsSurrogate.pas' {frmOptionsSurrogate},
  fOptionsTeams in 'CPRS-Chart-WVEHR3v2-16\Options\fOptionsTeams.pas' {frmOptionsTeams},
  fOptionsTitles in 'CPRS-Chart-WVEHR3v2-16\Options\fOptionsTitles.pas' {frmOptionsTitles},
  rOptions in 'CPRS-Chart-WVEHR3v2-16\Options\rOptions.pas',
  fOptions in 'CPRS-Chart-WVEHR3v2-16\Options\fOptions.pas' {frmOptions},
  uSignItems in 'CPRS-Chart-WVEHR3v2-16\uSignItems.pas',
  mCoPayDesc in 'CPRS-Chart-WVEHR3v2-16\mCoPayDesc.pas' {fraCoPayDesc: TFrame},
  XuDigSigSC_TLB in 'CPRS-Chart-WVEHR3v2-16\XuDigSigSC_TLB.pas',
  fOrdersCV in 'CPRS-Chart-WVEHR3v2-16\Orders\fOrdersCV.pas' {frmChgEvent},
  fODReleaseEvent in 'CPRS-Chart-WVEHR3v2-16\Orders\fODReleaseEvent.pas' {frmOrdersReleaseEvent},
  fODActive in 'CPRS-Chart-WVEHR3v2-16\Orders\fODActive.pas' {frmODActive},
  fDefaultEvent in 'CPRS-Chart-WVEHR3v2-16\fDefaultEvent.pas' {frmDefaultEvent},
  mEvntDelay in 'CPRS-Chart-WVEHR3v2-16\mEvntDelay.pas' {fraEvntDelayList: TFrame},
  fOrdersEvntRelease in 'CPRS-Chart-WVEHR3v2-16\Orders\fOrdersEvntRelease.pas' {frmOrdersEvntRelease},
  rECS in 'CPRS-Chart-WVEHR3v2-16\rECS.pas',
  fODChangeEvtDisp in 'CPRS-Chart-WVEHR3v2-16\Orders\fODChangeEvtDisp.pas' {frmChangeEventDisp},
  fODValidateAction in 'CPRS-Chart-WVEHR3v2-16\Orders\fODValidateAction.pas' {frmInvalidActionList},
  fODChild in 'CPRS-Chart-WVEHR3v2-16\Orders\fODChild.pas' {frmODChild},
  uOrPtf in 'CPRS-Chart-WVEHR3v2-16\uOrPtf.pas',
  fPatientFlagMulti in 'CPRS-Chart-WVEHR3v2-16\fPatientFlagMulti.pas' {frmFlags},
  fFrame in 'WVEHR\fFrame.pas' {frmFrame},
  fAlertForward in 'CPRS-Chart-WVEHR3v2-16\fAlertForward.pas' {frmAlertForward},
  fODMedNVA in 'CPRS-Chart-WVEHR3v2-16\Orders\fODMedNVA.pas' {frmODMedNVA},
  fPrintList in 'CPRS-Chart-WVEHR3v2-16\fPrintList.pas' {frmPrintList},
  fODChangeUnreleasedRenew in 'CPRS-Chart-WVEHR3v2-16\Orders\fODChangeUnreleasedRenew.pas' {frmODChangeUnreleasedRenew},
  UBAMessages in 'CPRS-Chart-WVEHR3v2-16\BA\UBAMessages.pas',
  UBAConst in 'CPRS-Chart-WVEHR3v2-16\BA\UBAConst.pas',
  UBAGlobals in 'CPRS-Chart-WVEHR3v2-16\BA\UBAGlobals.pas',
  fBALocalDiagnoses in 'CPRS-Chart-WVEHR3v2-16\BA\fBALocalDiagnoses.pas' {frmBALocalDiagnoses},
  fReview in 'CPRS-Chart-WVEHR3v2-16\fReview.pas' {frmReview},
  fARTFreeTextMsg in 'CPRS-Chart-WVEHR3v2-16\fARTFreeTextMsg.pas' {frmARTFreeTextMsg},
  fAllgyBox in 'CPRS-Chart-WVEHR3v2-16\fAllgyBox.pas' {frmAllgyBox},
  fARTAllgy in 'CPRS-Chart-WVEHR3v2-16\fARTAllgy.pas' {frmARTAllergy},
  UBACore in 'CPRS-Chart-WVEHR3v2-16\BA\UBACore.pas',
  fBAOptionsDiagnoses in 'CPRS-Chart-WVEHR3v2-16\BA\fBAOptionsDiagnoses.pas' {frmBAOptionsDiagnoses},
  fOtherSchedule in 'CPRS-Chart-WVEHR3v2-16\Orders\fOtherSchedule.pas' {frmOtherSchedule},
  fODBBank in 'CPRS-Chart-WVEHR3v2-16\Orders\fODBBank.pas' {frmODBBank},
  fNoteST in 'CPRS-Chart-WVEHR3v2-16\fNoteST.pas' {frmNotesSearchText},
  fNoteSTStop in 'CPRS-Chart-WVEHR3v2-16\fNoteSTStop.pas' {frmSearchStop},
  rGraphs in 'CPRS-Chart-WVEHR3v2-16\rGraphs.pas',
  fGraphs in 'CPRS-Chart-WVEHR3v2-16\fGraphs.pas' {frmGraphs},
  fGraphSettings in 'CPRS-Chart-WVEHR3v2-16\fGraphSettings.pas' {frmGraphSettings},
  fGraphProfiles in 'CPRS-Chart-WVEHR3v2-16\fGraphProfiles.pas' {frmGraphProfiles},
  uGraphs in 'CPRS-Chart-WVEHR3v2-16\uGraphs.pas',
  fClinicWardMeds in 'CPRS-Chart-WVEHR3v2-16\fClinicWardMeds.pas' {frmClinicWardMeds},
  fActivateDeactivate in 'CPRS-Chart-WVEHR3v2-16\fActivateDeactivate.pas' {frmActivateDeactive},
  uFormMonitor in 'CPRS-Chart-WVEHR3v2-16\uFormMonitor.pas',
  fODAllgy in 'CPRS-Chart-WVEHR3v2-16\Orders\fODAllgy.pas' {frmODAllergy},
  fDeviceSelect in 'CPRS-Chart-WVEHR3v2-16\fDeviceSelect.pas' {frmDeviceSelect},
  fLabCollTimes in 'CPRS-Chart-WVEHR3v2-16\fLabCollTimes.pas' {frmLabCollectTimes},
  fPostings in 'CPRS-Chart-WVEHR3v2-16\fPostings.pas' {frmPostings},
  fProbLex in 'CPRS-Chart-WVEHR3v2-16\fProbLex.pas' {frmPLLex},
  fTIUView in 'CPRS-Chart-WVEHR3v2-16\fTIUView.pas' {frmTIUView},
  fBase508Form in 'CPRS-Chart-WVEHR3v2-16\fBase508Form.pas' {frmBase508Form},
  fPrintLocation in 'CPRS-Chart-WVEHR3v2-16\fPrintLocation.pas' {frmPrintLocation},
  uVA508CPRSCompatibility in 'CPRS-Chart-WVEHR3v2-16\uVA508CPRSCompatibility.pas',
  uDlgComponents in 'CPRS-Chart-WVEHR3v2-16\uDlgComponents.pas',
  fGraphData in 'CPRS-Chart-WVEHR3v2-16\fGraphData.pas' {frmGraphData},
  fGraphOthers in 'CPRS-Chart-WVEHR3v2-16\fGraphOthers.pas' {frmGraphOthers},
  fIVRoutes in 'CPRS-Chart-WVEHR3v2-16\Orders\fIVRoutes.pas' {frmIVRoutes},
  fFindingTemplates in 'CPRS-Chart-WVEHR3v2-16\Templates\fFindingTemplates.pas' {frmFindingTemplates},
  fSpellNotify in 'CPRS-Chart-WVEHR3v2-16\fSpellNotify.pas' {frmSpellNotify},
  uCombatVet in 'CPRS-Chart-WVEHR3v2-16\uCombatVet.pas',
  fCombatVet in 'CPRS-Chart-WVEHR3v2-16\fCombatVet.pas' {frmCombatVet},
  fOCMonograph in 'CPRS-Chart-WVEHR3v2-16\Orders\fOCMonograph.pas' {frmOCMonograph},
  fCSRemaining in 'CPRS-Chart-WVEHR3v2-16\Orders\fCSRemaining.pas' {frmCSRemaining},
  Wcrypt2 in 'CPRS-Chart-WVEHR3v2-16\XuDigSig\Wcrypt2.pas',
  WinSCard in 'CPRS-Chart-WVEHR3v2-16\XuDigSig\WinSCard.pas',
  XlfHex in 'CPRS-Chart-WVEHR3v2-16\XuDigSig\XlfHex.pas',
  XlfMime in 'CPRS-Chart-WVEHR3v2-16\XuDigSig\XlfMime.pas',
  XuDsigConst in 'CPRS-Chart-WVEHR3v2-16\XuDigSig\XuDsigConst.pas',
  XuDsigS in 'CPRS-Chart-WVEHR3v2-16\XuDigSig\XuDsigS.pas',
  XuDsigU in 'CPRS-Chart-WVEHR3v2-16\XuDigSig\XuDsigU.pas',
  fPINPrompt in 'CPRS-Chart-WVEHR3v2-16\XuDigSig\fPINPrompt.pas',
  fProbFreetext in 'CPRS-Chart-WVEHR3v2-16\fProbFreetext.pas' {frmProbFreetext},
  mImgText in 'CPRS-Chart-WVEHR3v2-16\mImgText.pas' {fraImgText},
  uHelpManager in 'CPRS-Chart-WVEHR3v2-16\uHelpManager.pas',
  mTreeGrid in 'CPRS-Chart-WVEHR3v2-16\mTreeGrid.pas' {TreeGridFrame: TFrame},
  rVWEHR in 'WVEHR\VW\rVWEHR.pas',
  uVersionCompare in 'WVEHR\Tools\uVersionCompare.pas',
  frmEPrescribe in 'WVEHR\VW\frmEPrescribe.pas' {EPrescribeForm},
  fEventLog in 'WVEHR\EventLog\fEventLog.pas' {frmRPCLog},
  uGN_RPCLog in 'WVEHR\EventLog\uGN_RPCLog.pas',
  fVW_Alerts in 'WVEHR\PatientSelector\fVW_Alerts.pas' {frmVW_Alerts},
  fVW_DupPts in 'WVEHR\PatientSelector\fVW_DupPts.pas' {frmVW_DupPts},
  uVW_Utils in 'WVEHR\PatientSelector\uVW_Utils.pas',
  fAbout in 'WVEHR\fAbout.pas' {frmAbout},
  uVW_Size in 'WVEHR\Tools\uVW_Size.pas',
  uChangeLog in 'WVEHR\uChangeLog.pas',
  uSpell in 'CPRS-Chart-WVEHR3v2-16\uSpell.pas',
  fxLists in 'CPRS-Chart-WVEHR3v2-16\fxLists.pas' {frmDbgList},
  fPtSelMsg in 'CPRS-Chart-WVEHR3v2-16\fPtSelMsg.pas' {frmPtSelMsg},

  fPtDemo in 'CPRS-Chart-WVEHR3v2-16\fPtDemo.pas' {frmPtDemo}
  {$IFDEF WORLDVISTA}
  ,
  fVW_PtSelDemog in 'WVEHR\PatientSelector\fVW_PtSelDemog.pas' {frmVW_PtDemog},
  fVW_PtSelect in 'WVEHR\PatientSelector\fVW_PtSelect.pas' {frmVW_PtSelect},
  fVW_PtSelOptns in 'WVEHR\PatientSelector\fVW_PtSelOptns.pas' {frmVW_PtSelOptns},
  uVW_PtSelect in 'WVEHR\PatientSelector\uVW_PtSelect.pas',
  fVW_PtSelOptSave in 'WVEHR\PatientSelector\fVW_PtSelOptSave.pas' {frmVW_PtSelOptSave}
  {$ELSE}
  ,
  fPtSel in 'CPRS-Chart-WVEHR3v2-16\fPtSel.pas' {frmPtSel},
  fPtSelOptns in 'CPRS-Chart-WVEHR3v2-16\fPtSelOptns.pas' {frmPtSelOptns},
  fDupPts in 'CPRS-Chart-WVEHR3v2-16\fDupPts.pas' {frmDupPts},
  fPtSens in 'CPRS-Chart-WVEHR3v2-16\fPtSens.pas' {frmPtSens},
  fPtSelDemog in 'CPRS-Chart-WVEHR3v2-16\fPtSelDemog.pas' {frmPtSelDemog},
  fPtSelOptSave in 'CPRS-Chart-WVEHR3v2-16\fPtSelOptSave.pas' {frmPtSelOptSave}
  {$ENDIF}
  ;

{$R *.TLB}

{$R *.RES}

begin
  if not BorlandDLLVersionOK then
    exit; // Exit immediately if old or missing BORLNDMM.DLL
{$IFDEF DEBUG}
{$ELSE}
  RegisterCPRSTypeLibrary;
  // will halt program if /regserver or /unregserver param
{$ENDIF}
  Application.Initialize;

  if ParamSearch('SPLASH') <> 'OFF' then
    SplashAbout;

  if ConnectToServer('OR CPRS GUI CHART') then
  begin
    Application.Title := 'CPRS - Patient Chart';
    Application.HelpFile := 'help\cprs.htm';
    Application.CreateForm(TdmodShared, dmodShared);
  Application.CreateForm(TfrmFrame, frmFrame);
  Application.CreateForm(TfrmSearchStop, frmSearchStop);
  SplashHide;
    Application.Run;
  end
  else if assigned(RPCBrokerV) then
    ShowMessage(RPCBrokerV.RPCBError);
end.
