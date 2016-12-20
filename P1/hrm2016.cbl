       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAINHRMS.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 CHOICE PIC 9.

       SCREEN SECTION.
       01 CLEAR-SCREEN.
           02 BLANK SCREEN.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           DISPLAY "*******************************************"
             AT COLUMN NUMBER 15.
           DISPLAY "     HUMAN RESOURCE MANAGEMENT SYSTEM      "
             AT COLUMN NUMBER 15.
           DISPLAY "*******************************************"
             AT COLUMN NUMBER 15.
           DISPLAY "1 AT COLUMN NUMBER 25. HRMS WRITE".
           DISPLAY "2 AT COLUMN NUMBER 25. HRMS READ".
           DISPLAY "3 AT COLUMN NUMBER 25. EXIT".
           DISPLAY "ENTER YOUR CHOICE :" AT COLUMN NUMBER 25.
           ACCEPT CHOICE AT COLUMN NUMBER 46.
           IF CHOICE = 1
              CALL "EMPWRITE"
              CANCEL "EMPWRITE"
              GO TO MAIN-PARA
           ELSE
             IF CHOICE = 2
                CALL "EMPREAD"
                CANCEL "EMPREAD"
                GO TO MAIN-PARA
             ELSE
                STOP RUN.

       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMPREAD.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS EEMPID
           FILE STATUS IS FSE.

           SELECT LEAVEFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS LEMPID
           FILE STATUS IS FSL.

           SELECT BRANCHFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS BBRID
           FILE STATUS IS FSB.

           SELECT DESIGNATIONFILE ASSIGN TO DISK
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS FSDES.

           SELECT DEPARTMENTFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS DEPCODE
           FILE STATUS IS FSDEP.

           SELECT REVISIONFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS RREVID
           ALTERNATE RECORD KEY IS REMPID
           FILE STATUS IS FSR.

           SELECT PAYMENTFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS PEMPID
           FILE STATUS IS FSP.

           SELECT CONFIRMATIONFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS CCONID
           ALTERNATE RECORD KEY IS CEMPID
           FILE STATUS IS FSC.

           SELECT GRADEFILE ASSIGN TO DISK
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS FSG.

           SELECT TRANSFERFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS TTRFID
           FILE STATUS IS FST.

           SELECT EMPPERSONALFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS EPEMPID
           FILE STATUS IS FSEP.

       DATA DIVISION.
       FILE SECTION.
       FD EMPFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "EMP.DAT".
       01 EMPREC.
           02 EEMPID    PIC X(6).
           02 EEMPNAME  PIC X(25).
           02 EEMPADDR  PIC X(30).
           02 EPHONE    PIC X(10).
           02 EDOJ      PIC X(10).
           02 EDIP      PIC X(10).
           02 EUG       PIC X(4).
           02 EPG       PIC X(4).
           02 EPROFQ    PIC X(4).
           02 ESKILL    PIC X(10).
           02 EGRDNO    PIC 99.
           02 EBRNID    PIC X(6).
           02 EDESID    PIC X(6).

       FD LEAVEFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "LEAVE.DAT".
       01 LEAVEREC.
           02 LEMPID    PIC X(6).
           02 LFMDATE   PIC X(10).
           02 LTODATE   PIC X(10).
           02 LLEVCAT   PIC X(3).

       FD BRANCHFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "BRANCH.DAT".
       01 BRANCHREC.
           02 BBRID    PIC X(6).
           02 BBRNAME  PIC X(15).
           02 BBRADD   PIC X(30).
           02 BBRPH    PIC X(10).
           02 BEMAIL   PIC X(20).
           02 BMGRNAME PIC X(25).

       FD DESIGNATIONFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DESIG.DAT".
       01 DESIGNATIONREC.
           02 DESID    PIC X(6).
           02 DESIGN   PIC X(15).
           02 DESHRT   PIC X(4).

       FD DEPARTMENTFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DEPART.DAT".
       01 DEPARTMENTREC.
           02 DEPCODE  PIC X(6).
           02 DEPNAME  PIC X(20).

       FD REVISIONFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "REVISION.DAT".
       01 REVISIONREC.
           02 RREVID   PIC X(6).
           02 REMPID   PIC X(6).
           02 RDESCODE PIC X(6).
           02 RBASIC   PIC 9(6)V99.
           02 RHRA     PIC 9(6)V99.
           02 RDPA     PIC 9(6)V99.
           02 RPPA     PIC 9(6)V99.
           02 REDUA    PIC 9(6)V99.
           02 RTECHJR  PIC 9(6)V99.
           02 RLUNCHA  PIC 9(6)V99.
           02 RCONVEY  PIC 9(6)V99.
           02 RBUSATR  PIC 9(6)V99.
           02 RLTA     PIC 9(6)V99.
           02 RPF      PIC 9(6)V99.
           02 RESI     PIC 9(6)V99.
           02 RREVDATE PIC X(10).

       FD PAYMENTFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "PAYMENT.DAT".
       01 PAYMENTREC.
           02 PEMPID   PIC X(6).
           02 PBASIC   PIC 9(6)V99.
           02 PDA      PIC 9(6)V99.
           02 PCCA     PIC 9(6)V99.
           02 PHRA     PIC 9(6)V99.
           02 PDPA     PIC 9(6)V99.
           02 PPPA     PIC 9(6)V99.
           02 PEDUA    PIC 9(6)V99.
           02 PTECHJR  PIC 9(6)V99.
           02 PLUNCHA  PIC 9(6)V99.
           02 PCONVEY  PIC 9(6)V99.
           02 PBUSATR  PIC 9(6)V99.
           02 PLTA     PIC 9(6)V99.
           02 PPF      PIC 9(6)V99.
           02 PESI     PIC 9(6)V99.
           02 PGRTY    PIC 9(6)V99.
           02 PPTAX    PIC 9(6)V99.
           02 PITAX    PIC 9(6)V99.
           02 PLOAN    PIC 9(8)V99.
           02 PLOANDA  PIC 9(8)V99.
           02 POTHERD  PIC 9(6)V99.
           02 PPERINC  PIC 9(6)V99.
           02 PMEDI    PIC 9(6)V99.
           02 PBOOK    PIC 9(6)V99.
           02 PENTER   PIC 9(6)V99.
           02 PTPH     PIC 9(6)V99.
           02 PHOUSE   PIC 9(6)V99.
           02 PVEHMAN  PIC 9(6)V99.
           02 PCREDIT  PIC 9(6)V99.
           02 PCLUB    PIC 9(6)V99.
           02 PCL      PIC 99.
           02 PSL      PIC 99.
           02 PPL      PIC 99.
           02 PLLOP    PIC 999.
           02 POTHERL  PIC 999.

       FD CONFIRMATIONFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "CONFIRM.DAT".
       01 CONFIRMATIONREC.
           02 CCONID   PIC X(6).
           02 CEMPID   PIC X(6).
           02 CCDATE   PIC X(6).

       FD GRADEFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "GRADE.DAT".
       01 GRADEREC.
           02 GGRADE   PIC 99.
           02 GDESIGN  PIC X(25).

       FD TRANSFERFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "TRANSFER.DAT".
       01 TRANSFERREC.
           02 TTRFID   PIC X(6).
           02 TEMPID   PIC X(6).
           02 TOBRID   PIC X(6).
           02 TTRFDT   PIC X(10).

       FD EMPPERSONALFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "EMPPER.DAT".
       01 EMPPERSONALREC.
           02 EPEMPID  PIC X(6).
           02 EPTADD   PIC X(30).
           02 EPTPH    PIC X(10).
           02 EPDOB    PIC X(10).
           02 EPPOB    PIC X(10).
           02 EPLANG   PIC X(15).
           02 EPBLOOD  PIC X(4).
           02 EPWEIGHT PIC 999.
           02 EPHEIGHT PIC 999.
           02 EPVISION PIC X(15).
           02 EPFATHER PIC X(25).
           02 EPDOBF   PIC X(10).
           02 EPMOTHER PIC X(25).
           02 EPDOBM   PIC X(10).
           02 EPSPOUSE PIC X(25).
           02 EPCHILD  PIC X(25).
           02 EPDOBC   PIC X(10).

       WORKING-STORAGE SECTION.
       77 FSE   PIC XX.
       77 FSL   PIC XX.
       77 FSB   PIC XX.
       77 FSDES PIC XX.
       77 FSDEP PIC XX.
       77 FSR   PIC XX.
       77 FSP   PIC XX.
       77 FSC   PIC XX.
       77 FSG   PIC XX.
       77 FST   PIC XX.
       77 FSEP  PIC XX.
       77 DES   PIC X(6).
       77 GR    PIC 99.
       77 CHOICE PIC 99.

       SCREEN SECTION.
       01 CLEAR-SCREEN.
           02 BLANK SCREEN.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           DISPLAY "*******************************************"
             AT COLUMN NUMBER 10.
           DISPLAY "     HUMAN RESOURCE MANAGEMENT SYSTEM      "
             AT COLUMN NUMBER 10.
           DISPLAY "*******************************************"
             AT COLUMN NUMBER 10.
           DISPLAY " 1 AT COLUMN NUMBER 5. EMPLOYEE FILE".
           DISPLAY " 2 AT COLUMN NUMBER 5. LEAVE FILE".
           DISPLAY " 3 AT COLUMN NUMBER 5. BRANCH FILE".
           DISPLAY " 4 AT COLUMN NUMBER 5. DESIGNATION FILE".
           DISPLAY " 5 AT COLUMN NUMBER 5. DEPARTMENT FILE".
           DISPLAY " 6 AT COLUMN NUMBER 5. REVISION FILE".
           DISPLAY " 7 AT COLUMN NUMBER 5. PAYMENT FILE".
           DISPLAY " 8 AT COLUMN NUMBER 5. CONFIRMATION FILE".
           DISPLAY " 9 AT COLUMN NUMBER 5. GRADE FILE".
           DISPLAY "10 AT COLUMN NUMBER 5. TRANSFER FILE".
           DISPLAY "11 AT COLUMN NUMBER 5. EMPLOYEE PERSONAL FILE".
           DISPLAY "12 AT COLUMN NUMBER 5. EXIT".
           DISPLAY "ENTER U R CHOICE :" AT COLUMN NUMBER 25.
           ACCEPT CHOICE AT COLUMN NUMBER 45.
           IF CHOICE = 1
              GO TO EMP-PARA
           ELSE
             IF CHOICE = 2
                GO TO LEAVE-PARA
             ELSE
               IF CHOICE = 3
                  GO TO BRANCH-PARA
               ELSE
                 IF CHOICE = 4
                    GO TO DESIGNATION-PARA
                 ELSE
                   IF CHOICE = 5
                      GO TO DEPARTMENT-PARA
                   ELSE
                     IF CHOICE = 6
                        GO TO REVISION-PARA
                     ELSE
                       IF CHOICE = 7
                          GO TO PAYMENT-PARA
                       ELSE
                          IF CHOICE = 8
                             GO TO CONFIRMATION-PARA
                          ELSE
                            IF CHOICE = 9
                               GO TO GRADE-PARA
                            ELSE
                              IF CHOICE = 10
                                 GO TO TRANSFER-PARA
                              ELSE
                                IF CHOICE = 11
                                   GO TO EMPPERSONAL-PARA
                                 ELSE
                                   EXIT PROGRAM.

       EMP-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           OPEN INPUT EMPFILE.
           DISPLAY "ENTER CODE :".
           ACCEPT EEMPID.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           READ EMPFILE INVALID KEY GO TO ERROR-EMP-PARA.
           DISPLAY " CODE                 :" EEMPID AT COLUMN NUMBER 1.
           DISPLAY " NAME                 :" EEMPNAME
             AT COLUMN NUMBER 1.
           DISPLAY " ADDRESS              :" EEMPADDR
             AT COLUMN NUMBER 1.
           DISPLAY " PHONE                :" EPHONE AT COLUMN NUMBER 1.
           DISPLAY " DATE OF JOIN         :" EDOJ AT COLUMN NUMBER 1.
           DISPLAY " DIPLOMA              :" EDIP AT COLUMN NUMBER 1.
           DISPLAY " UG                   :" EUG AT COLUMN NUMBER 1.
           DISPLAY " PG                   :" EPG AT COLUMN NUMBER 1.
           DISPLAY " PROFESSIONAL QUALITY :" EPROFQ AT COLUMN NUMBER 1.
           DISPLAY " SKILL SET            :" ESKILL AT COLUMN NUMBER 1.
           DISPLAY " GRADE NUMBER         :" EGRDNO AT COLUMN NUMBER 1.
           DISPLAY " BRANCH CODE          :" EBRNID AT COLUMN NUMBER 1.
           DISPLAY " DESIGNATION CODE     :" EDESID AT COLUMN NUMBER 1.
           CLOSE EMPFILE.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU"
             AT COLUMN NUMBER 10.
           STOP ' '.
           GO TO MAIN-PARA.

       LEAVE-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           OPEN INPUT LEAVEFILE.
           DISPLAY "ENTER CODE :".
           ACCEPT LEMPID.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           READ LEAVEFILE INVALID KEY GO TO ERROR-LEAVE-PARA.
           DISPLAY " CODE           :" LEMPID AT COLUMN NUMBER 1.
           DISPLAY " DATE           :" LFMDATE AT COLUMN NUMBER 1.
           DISPLAY " DATE           :" LTODATE AT COLUMN NUMBER 1.
           DISPLAY " LEAVE CATEGORY :" LLEVCAT AT COLUMN NUMBER 1.
           CLOSE LEAVEFILE.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU"
             AT COLUMN NUMBER 10.
           STOP ' '.
           GO TO MAIN-PARA.

        BRANCH-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           OPEN INPUT BRANCHFILE.
           DISPLAY " BRANCH CODE :".
           ACCEPT BBRID.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           READ BRANCHFILE INVALID KEY GO TO ERROR-BRANCH-PARA.
           DISPLAY " BRANCH CODE    :" BBRID AT COLUMN NUMBER 1.
           DISPLAY " BRANCH NAME    :" BBRNAME AT COLUMN NUMBER 1.
           DISPLAY " BRANCH ADDRESS :" BBRADD AT COLUMN NUMBER 1.
           DISPLAY " PHONE          :" BBRPH AT COLUMN NUMBER 1.
           DISPLAY " E-MAIL         :" BEMAIL  AT COLUMN NUMBER 1.
           DISPLAY " MANAGER NAME   :" BMGRNAME AT COLUMN NUMBER 1.
           CLOSE BRANCHFILE.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU"
             AT COLUMN NUMBER 10.
           STOP ' '.
           GO TO MAIN-PARA.

       DESIGNATION-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           OPEN INPUT DESIGNATIONFILE.
           DISPLAY "ENTER THE DESIGNATION CODE :".
           ACCEPT DES.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           PERFORM DES-READ-PARA UNTIL FSDES = 10.
       DES-READ-PARA.
           READ DESIGNATIONFILE AT END GO TO DES-EXIT-PARA.
           IF DESID = DES
           DISPLAY " DESIGNATION CODE     :" DESID AT COLUMN NUMBER 1
           DISPLAY " DESIGNATION          :" DESIGN AT COLUMN NUMBER 1
           DISPLAY " DESIGNATION IN SHORT :" DESHRT AT COLUMN NUMBER 1.
       DES-EXIT-PARA.
           CLOSE DESIGNATIONFILE.
           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       DEPARTMENT-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           OPEN INPUT DEPARTMENTFILE.
           DISPLAY "ENTER DEP CODE :".
           ACCEPT DEPCODE.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           READ DEPARTMENTFILE INVALID KEY
                     GO TO ERROR-DEPARTMENT-PARA.
           DISPLAY " DEPARTMENT CODE :" DEPCODE AT COLUMN NUMBER 1.
           DISPLAY " DEPARTMENT NAME :" DEPNAME AT COLUMN NUMBER 1.
           CLOSE DEPARTMENTFILE.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU"
             AT COLUMN NUMBER 10.
           STOP ' '.
           GO TO MAIN-PARA.

       REVISION-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           OPEN INPUT REVISIONFILE.
           DISPLAY "ENTER REVISION CODE:".
           ACCEPT RREVID.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           READ REVISIONFILE INVALID KEY
                    GO TO ERROR-REVISION-PARA.
           DISPLAY " REVISION CODE           :" RREVID
             AT COLUMN NUMBER 1.
           DISPLAY " EMPLOYEE CODE           :" REMPID
             AT COLUMN NUMBER 1.
           DISPLAY " DESIGNATION CODE        :" RDESCODE
             AT COLUMN NUMBER 1.
           DISPLAY " BASIC                   :" RBASIC
             AT COLUMN NUMBER 1.
           DISPLAY " HRA                     :" RHRA
             AT COLUMN NUMBER 1.
           DISPLAY " DPA                     :" RDPA
             AT COLUMN NUMBER 1.
           DISPLAY " PPA                     :" RPPA
             AT COLUMN NUMBER 1.
           DISPLAY " EDUCATIONAL ALLOWANCE   :" REDUA
             AT COLUMN NUMBER 1.
           DISPLAY " TECHNICAL JOURNAL       :" RTECHJR
             AT COLUMN NUMBER 1.
           DISPLAY " LUNCH ALLOWANCE        :" RLUNCHA
             AT COLUMN NUMBER 1.
           DISPLAY " CONVEYANCE             :" RCONVEY
             AT COLUMN NUMBER 1.
           DISPLAY " BUSINESS ATTIREMENT    :" RBUSATR
             AT COLUMN NUMBER 1.
           DISPLAY " LEAVE TRAVEL ALLOWANCE :" RLTA AT COLUMN NUMBER 1.
           DISPLAY " PF                     :" RPF AT COLUMN NUMBER 1.
           DISPLAY " ESI                    :" RESI AT COLUMN NUMBER 1.
           DISPLAY " REVISED DATE           :" RREVDATE
             AT COLUMN NUMBER 1.
           CLOSE REVISIONFILE.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU"
             AT COLUMN NUMBER 10.
           STOP ' '.
           GO TO MAIN-PARA.

       PAYMENT-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           OPEN INPUT PAYMENTFILE.
           DISPLAY "ENTER EMP CODE :".
           ACCEPT PEMPID.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           READ PAYMENTFILE INVALID KEY GO TO ERROR-PAYMENT-PARA.
           DISPLAY " EMPLOYEE CODE                  :" PEMPID
             AT COLUMN NUMBER 1.
           DISPLAY " BASIC                          :" PBASIC
             AT COLUMN NUMBER 1.
           DISPLAY " DEARNESS ALLOWANCE             :" PDA
             AT COLUMN NUMBER 1.
           DISPLAY " CITY COMPENSATORY ALLOWANCE    :" PCCA
             AT COLUMN NUMBER 1.
           DISPLAY " HRA                            :" PHRA
             AT COLUMN NUMBER 1.
           DISPLAY " DPA                            :" PDPA
             AT COLUMN NUMBER 1.
           DISPLAY " PPA                            :" PPPA
             AT COLUMN NUMBER 1.
           DISPLAY " EDUCATIONAL ALLOWANCE          :" PEDUA
             AT COLUMN NUMBER 1.
           DISPLAY " TECHNICAL JOURNAL              :" PTECHJR
             AT COLUMN NUMBER 1.
           DISPLAY " LUNCH ALLOWANCE               :" PLUNCHA
             AT COLUMN NUMBER 1.
           DISPLAY " CONVEYANCE                    :" PCONVEY
             AT COLUMN NUMBER 1.
           DISPLAY " BUSINESS ATTIREMENT           :" PBUSATR
             AT COLUMN NUMBER 1.
           DISPLAY " LEAVE TRAVEL ALLOWANCE        :" PLTA
             AT COLUMN NUMBER 1.
           DISPLAY " PF                            :" PPF
             AT COLUMN NUMBER 1.
           DISPLAY " ESI                           :" PESI
             AT COLUMN NUMBER 1.
           DISPLAY " GRATUITY                      :" PGRTY
             AT COLUMN NUMBER 1.
           DISPLAY " PROFESSIONAL TAX              :" PPTAX
             AT COLUMN NUMBER 1.
           DISPLAY " INCOME TAX                    :" PITAX
             AT COLUMN NUMBER 1.
           DISPLAY " LOAN                          :" PLOAN
             AT COLUMN NUMBER 1.
           DISPLAY " LOAN DEDUCTION AMOUNT         :" PLOANDA
             AT COLUMN NUMBER 1.
           DISPLAY " OTHER DEDUCTION               :" POTHERD
             AT COLUMN NUMBER 1.
           DISPLAY " PERFORMANCE INCENTIVE         :" PPERINC
             AT COLUMN NUMBER 1.
           DISPLAY " MEDICAL REIMBURSEMENT         :" PMEDI
             AT COLUMN NUMBER 1.
           DISPLAY " BOOK REIMBURSEMENT            :" PBOOK
             AT COLUMN NUMBER 1.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           DISPLAY " ENTERTAINMENT                  :" PENTER
             AT COLUMN NUMBER 1.
           DISPLAY " PHONE                          :" PTPH
             AT COLUMN NUMBER 1.
           DISPLAY " HOUSE RELATED                  :" PHOUSE
             AT COLUMN NUMBER 1.
           DISPLAY " VEHICLE MAINTENANCE            :" PVEHMAN
             AT COLUMN NUMBER 1.
           DISPLAY " CREDIT CARD                    :" PCREDIT
             AT COLUMN NUMBER 1.
           DISPLAY " CLUB                           :" PCLUB
             AT COLUMN NUMBER 1.
           DISPLAY " CASUAL LEAVE                   :" PCL
             AT COLUMN NUMBER 1.
           DISPLAY " SICK LEAVE                     :" PSL
             AT COLUMN NUMBER 1.
           DISPLAY " PAID LEAVE                     :" PPL
             AT COLUMN NUMBER 1
           DISPLAY " LEAVE LOSS OF PAY             :" PLLOP
             AT COLUMN NUMBER 1.
           DISPLAY " OTHER LEAVES                  :" POTHERL
             AT COLUMN NUMBER 1.
           CLOSE PAYMENTFILE.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU"
             AT COLUMN NUMBER 10.
           STOP ' '.
           GO TO MAIN-PARA.

       CONFIRMATION-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           OPEN INPUT CONFIRMATIONFILE.
           DISPLAY "ENTER CODE :".
           ACCEPT CCONID.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           READ CONFIRMATIONFILE INVALID KEY
                   GO TO ERROR-CONFIRMATION-PARA.
           DISPLAY " CONFIRMATION CODE :" CCONID AT COLUMN NUMBER 1.
           DISPLAY " EMPLOYEE CODE     :" CEMPID AT COLUMN NUMBER 1.
           DISPLAY " CONFIRMATION DATE :" CCDATE AT COLUMN NUMBER 1.
           CLOSE CONFIRMATIONFILE.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU"
             AT COLUMN NUMBER 10.
           STOP ' '.
           GO TO MAIN-PARA.

       GRADE-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           OPEN INPUT GRADEFILE.
           DISPLAY "ENTER GRADE NO. :".
           ACCEPT GR.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           PERFORM GR-READ-PARA UNTIL FSG = 10.
       GR-READ-PARA.
           READ GRADEFILE AT END GO TO GR-EXIT-PARA.
           IF GGRADE = GR
           DISPLAY " GRADE NO AT COLUMN NUMBER 1.   :" GGRADE.
           DISPLAY " DESIGNATION :" GDESIGN AT COLUMN NUMBER 1.
       GR-EXIT-PARA.
           CLOSE GRADEFILE.
           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       TRANSFER-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           OPEN INPUT TRANSFERFILE.
           DISPLAY "ENTER TRANSFER CODE :".
           ACCEPT TTRFID.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           READ TRANSFERFILE INVALID KEY GO TO ERROR-TRANSFER-PARA.
           DISPLAY " TRANSFER CODE     :" TTRFID AT COLUMN NUMBER 1.
           DISPLAY " EMP CODE          :" TEMPID AT COLUMN NUMBER 1.
           DISPLAY " OLD BRANCH CODE   :" TOBRID AT COLUMN NUMBER 1.
           DISPLAY " TRANSFER DATE     :" TTRFDT AT COLUMN NUMBER 1.
           CLOSE TRANSFERFILE.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU"
             AT COLUMN NUMBER 10.
           STOP ' '.
           GO TO MAIN-PARA.

       EMPPERSONAL-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           OPEN INPUT EMPPERSONALFILE.
           DISPLAY "ENTER EMP CODE :".
           ACCEPT EPEMPID.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           READ EMPPERSONALFILE INVALID KEY
                           GO TO ERROR-EMPPERSONAL-PARA.
           DISPLAY " EMPLOYEE CODE     :" EPEMPID AT COLUMN NUMBER 1.
           DISPLAY " TEMPORARY ADDRESS :" EPTADD AT COLUMN NUMBER 1.
           DISPLAY " PHONE             :" EPTPH AT COLUMN NUMBER 1.
           DISPLAY " DOB               :" EPDOB AT COLUMN NUMBER 1.
           DISPLAY " POB               :" EPPOB AT COLUMN NUMBER 1.
           DISPLAY " LANGUAGE KNOWN    :" EPLANG AT COLUMN NUMBER 1.
           DISPLAY " BLOOD GROUP       :" EPBLOOD AT COLUMN NUMBER 1.
           DISPLAY " WEIGHT            :" EPWEIGHT AT COLUMN NUMBER 1.
           DISPLAY " HEIGHT            :" EPHEIGHT AT COLUMN NUMBER 1.
           DISPLAY " VISION           :" EPVISION AT COLUMN NUMBER 1.
           DISPLAY " FATHER'S NAME    :" EPFATHER AT COLUMN NUMBER 1.
           DISPLAY " DOB OF FATHER    :" EPDOBF AT COLUMN NUMBER 1.
           DISPLAY " MOTHER'S NAME    :" EPMOTHER AT COLUMN NUMBER 1.
           DISPLAY " DOB OF MOTHER    :" EPDOBM AT COLUMN NUMBER 1.
           DISPLAY " SPOUSE NAME      :" EPSPOUSE AT COLUMN NUMBER 1.
           GO TO MAIN-PARA.
           DISPLAY " CHILD NAME       :" EPCHILD AT COLUMN NUMBER 1.
           DISPLAY " DOB OF CHILD     :" EPDOBC AT COLUMN NUMBER 1.
           CLOSE EMPPERSONALFILE.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU"
             AT COLUMN NUMBER 10.
           STOP ' '.

       ERROR-EMP-PARA.
           CLOSE EMPFILE.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           DISPLAY "INVALID CODE" AT COLUMN NUMBER 30.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU"
             AT COLUMN NUMBER 10.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-LEAVE-PARA.
           CLOSE LEAVEFILE.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           DISPLAY "INVALID CODE" AT COLUMN NUMBER 30.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU"
             AT COLUMN NUMBER 10.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-BRANCH-PARA.
           CLOSE BRANCHFILE.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           DISPLAY "INVALID CODE" AT COLUMN NUMBER 30.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU"
             AT COLUMN NUMBER 10.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-DEPARTMENT-PARA.
           CLOSE DEPARTMENTFILE.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           DISPLAY "INVALID CODE" AT COLUMN NUMBER 30.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU"
             AT COLUMN NUMBER 10.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-REVISION-PARA.
           CLOSE REVISIONFILE.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           DISPLAY "INVALID CODE" AT COLUMN NUMBER 30.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU"
             AT COLUMN NUMBER 10.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-PAYMENT-PARA.
           CLOSE PAYMENTFILE.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           DISPLAY "INVALID CODE" AT COLUMN NUMBER 30.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU"
             AT COLUMN NUMBER 10.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-CONFIRMATION-PARA.
           CLOSE CONFIRMATIONFILE.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           DISPLAY "INVALID CODE" AT COLUMN NUMBER 30.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU"
             AT COLUMN NUMBER 10.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-TRANSFER-PARA.
           CLOSE TRANSFERFILE.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           DISPLAY "INVALID CODE" AT COLUMN NUMBER 30.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU"
             AT COLUMN NUMBER 10.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-EMPPERSONAL-PARA.
           CLOSE EMPPERSONALFILE.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           DISPLAY "INVALID CODE" AT COLUMN NUMBER 30.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU"
             AT COLUMN NUMBER 10.
           STOP ' '.
           GO TO MAIN-PARA.

       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMP.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS EEMPID
           FILE STATUS IS FSO.

           SELECT LEAVEFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS LEMPID
           FILE STATUS IS FSL.

           SELECT BRANCHFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS BBRID
           FILE STATUS IS FSB.

           SELECT DESIGNATIONFILE ASSIGN TO DISK
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS FSDES.

           SELECT DEPARTMENTFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS DEPCODE
           FILE STATUS IS FSDEP.

           SELECT REVISIONFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS RREVID
           ALTERNATE RECORD KEY IS REMPID
           FILE STATUS IS FSR.

           SELECT PAYMENTFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS PEMPID
           FILE STATUS IS FSP.

           SELECT CONFIRMATIONFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS CCONID
           ALTERNATE RECORD KEY IS CEMPID
           FILE STATUS IS FSC.

           SELECT GRADEFILE ASSIGN TO DISK
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS FSG.

           SELECT TRANSFERFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS TTRFID
           FILE STATUS IS FST.

           SELECT EMPPERSONALFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS EPEMPID
           FILE STATUS IS FSEP.

       DATA DIVISION.
       FILE SECTION.
       FD EMPFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "EMP.DAT".
       01 EMPREC.
           02 EEMPID    PIC X(6).
           02 EEMPNAME  PIC X(25).
           02 EEMPADDR  PIC X(30).
           02 EPHONE    PIC X(10).
           02 EDOJ      PIC X(10).
           02 EDIP      PIC X(10).
           02 EUG       PIC X(4).
           02 EPG       PIC X(4).
           02 EPROFQ    PIC X(4).
           02 ESKILL    PIC X(10).
           02 EGRDNO    PIC 99.
           02 EBRNID    PIC X(6).
           02 EDESID    PIC X(6).

       FD LEAVEFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "LEAVE.DAT".
       01 LEAVEREC.
           02 LEMPID    PIC X(6).
           02 LFMDATE   PIC X(10).
           02 LTODATE   PIC X(10).
           02 LLEVCAT   PIC X(3).

       FD BRANCHFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "BRANCH.DAT".
       01 BRANCHREC.
           02 BBRID    PIC X(6).
           02 BBRNAME  PIC X(15).
           02 BBRADD   PIC X(30).
           02 BBRPH    PIC X(10).
           02 BEMAIL   PIC X(20).
           02 BMGRNAME PIC X(25).

       FD DESIGNATIONFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DESIG.DAT".
       01 DESIGNATIONREC.
           02 DESID    PIC X(6).
           02 DESIGN   PIC X(15).
           02 DESHRT   PIC X(4).

       FD DEPARTMENTFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DEPART.DAT".
       01 DEPARTMENTREC.
           02 DEPCODE  PIC X(6).
           02 DEPNAME  PIC X(20).

       FD REVISIONFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "REVISION.DAT".
       01 REVISIONREC.
           02 RREVID   PIC X(6).
           02 REMPID   PIC X(6).
           02 RDESCODE PIC X(6).
           02 RBASIC   PIC 9(6)V99.
           02 RHRA     PIC 9(6)V99.
           02 RDPA     PIC 9(6)V99.
           02 RPPA     PIC 9(6)V99.
           02 REDUA    PIC 9(6)V99.
           02 RTECHJR  PIC 9(6)V99.
           02 RLUNCHA  PIC 9(6)V99.
           02 RCONVEY  PIC 9(6)V99.
           02 RBUSATR  PIC 9(6)V99.
           02 RLTA     PIC 9(6)V99.
           02 RPF      PIC 9(6)V99.
           02 RESI     PIC 9(6)V99.
           02 RREVDATE PIC X(10).

       FD PAYMENTFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "PAYMENT.DAT".
       01 PAYMENTREC.
           02 PEMPID   PIC X(6).
           02 PBASIC   PIC 9(6)V99.
           02 PDA      PIC 9(6)V99.
           02 PCCA     PIC 9(6)V99.
           02 PHRA     PIC 9(6)V99.
           02 PDPA     PIC 9(6)V99.
           02 PPPA     PIC 9(6)V99.
           02 PEDUA    PIC 9(6)V99.
           02 PTECHJR  PIC 9(6)V99.
           02 PLUNCHA  PIC 9(6)V99.
           02 PCONVEY  PIC 9(6)V99.
           02 PBUSATR  PIC 9(6)V99.
           02 PLTA     PIC 9(6)V99.
           02 PPF      PIC 9(6)V99.
           02 PESI     PIC 9(6)V99.
           02 PGRTY    PIC 9(6)V99.
           02 PPTAX    PIC 9(6)V99.
           02 PITAX    PIC 9(6)V99.
           02 PLOAN    PIC 9(8)V99.
           02 PLOANDA  PIC 9(8)V99.
           02 POTHERD  PIC 9(6)V99.
           02 PPERINC  PIC 9(6)V99.
           02 PMEDI    PIC 9(6)V99.
           02 PBOOK    PIC 9(6)V99.
           02 PENTER   PIC 9(6)V99.
           02 PTPH     PIC 9(6)V99.
           02 PHOUSE   PIC 9(6)V99.
           02 PVEHMAN  PIC 9(6)V99.
           02 PCREDIT  PIC 9(6)V99.
           02 PCLUB    PIC 9(6)V99.
           02 PCL      PIC 99.
           02 PSL      PIC 99.
           02 PPL      PIC 99.
           02 PLLOP    PIC 999.
           02 POTHERL  PIC 999.

       FD CONFIRMATIONFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "CONFIRM.DAT".
       01 CONFIRMATIONREC.
           02 CCONID   PIC X(6).
           02 CEMPID   PIC X(6).
           02 CCDATE   PIC X(6).

       FD GRADEFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "GRADE.DAT".
       01 GRADEREC.
           02 GGRADE   PIC 99.
           02 GDESIGN  PIC X(25).

       FD TRANSFERFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "TRANSFER.DAT".
       01 TRANSFERREC.
           02 TTRFID   PIC X(6).
           02 TEMPID   PIC X(6).
           02 TOBRID   PIC X(6).
           02 TTRFDT   PIC X(10).

       FD EMPPERSONALFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "EMPPER.DAT".
       01 EMPPERSONALREC.
           02 EPEMPID  PIC X(6).
           02 EPTADD   PIC X(30).
           02 EPTPH    PIC X(10).
           02 EPDOB    PIC X(10).
           02 EPPOB    PIC X(10).
           02 EPLANG   PIC X(15).
           02 EPBLOOD  PIC X(4).
           02 EPWEIGHT PIC 999.
           02 EPHEIGHT PIC 999.
           02 EPVISION PIC X(15).
           02 EPFATHER PIC X(25).
           02 EPDOBF   PIC X(10).
           02 EPMOTHER PIC X(25).
           02 EPDOBM   PIC X(10).
           02 EPSPOUSE PIC X(25).
           02 EPCHILD  PIC X(25).
           02 EPDOBC   PIC X(10).

       WORKING-STORAGE SECTION.
       77 FSO   PIC XX.
       77 FSL   PIC XX.
       77 FSB   PIC XX.
       77 FSDES PIC XX.
       77 FSDEP PIC XX.
       77 FSR   PIC XX.
       77 FSP   PIC XX.
       77 FSC   PIC XX.
       77 FSG   PIC XX.
       77 FST   PIC XX.
       77 FSEP  PIC XX.
       77 CHOICE PIC 99.

       SCREEN SECTION.
       01 CLEAR-SCREEN.
           02 BLANK SCREEN.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           DISPLAY "*******************************************"
             AT COLUMN NUMBER 10.
           DISPLAY "     HUMAN RESOURCE MANAGEMENT SYSTEM      "
             AT COLUMN NUMBER 10.
           DISPLAY "*******************************************"
             AT COLUMN NUMBER 10.
           DISPLAY " 1 AT COLUMN NUMBER 5. EMPLOYEE FILE".
           DISPLAY " 2 AT COLUMN NUMBER 5. LEAVE FILE".
           DISPLAY " 3 AT COLUMN NUMBER 5. BRANCH FILE".
           DISPLAY " 4 AT COLUMN NUMBER 5. DESIGNATION FILE".
           DISPLAY " 5 AT COLUMN NUMBER 5. DEPARTMENT FILE".
           DISPLAY " 6 AT COLUMN NUMBER 5. REVISION FILE".
           DISPLAY " 7 AT COLUMN NUMBER 5. PAYMENT FILE".
           DISPLAY " 8 AT COLUMN NUMBER 5. CONFIRMATION FILE".
           DISPLAY " 9 AT COLUMN NUMBER 5. GRADE FILE".
           DISPLAY "10 AT COLUMN NUMBER 5. TRANSFER FILE".
           DISPLAY "11 AT COLUMN NUMBER 5. EMPLOYEE PERSONAL FILE".
           DISPLAY "12 AT COLUMN NUMBER 5. EXIT".
           DISPLAY "ENTER U R CHOICE :" AT COLUMN NUMBER 25.
           ACCEPT CHOICE AT COLUMN NUMBER 45.
           IF CHOICE = 1
              GO TO EMP-PARA
           ELSE
             IF CHOICE = 2
                GO TO LEAVE-PARA
             ELSE
               IF CHOICE = 3
                  GO TO BRANCH-PARA
               ELSE
                 IF CHOICE = 4
                    GO TO DESIGNATION-PARA
                 ELSE
                   IF CHOICE = 5
                      GO TO DEPARTMENT-PARA
                   ELSE
                     IF CHOICE = 6
                        GO TO REVISION-PARA
                     ELSE
                       IF CHOICE = 7
                          GO TO PAYMENT-PARA
                       ELSE
                          IF CHOICE = 8
                             GO TO CONFIRMATION-PARA
                          ELSE
                            IF CHOICE = 9
                               GO TO GRADE-PARA
                            ELSE
                              IF CHOICE = 10
                                 GO TO TRANSFER-PARA
                              ELSE
                                IF CHOICE = 11
                                   GO TO EMPPERSONAL-PARA
                                 ELSE
                                   EXIT PROGRAM.

       EMP-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           OPEN I-O EMPFILE.
           IF FSO = 30
              OPEN OUTPUT EMPFILE.
           DISPLAY "ENTER CODE :" AT COLUMN NUMBER 1.
           ACCEPT EEMPID AT COLUMN NUMBER 35.
           DISPLAY "ENTER NAME :" AT COLUMN NUMBER 1.
           ACCEPT EEMPNAME AT COLUMN NUMBER 35.
           DISPLAY "ENTER ADDRESS :" AT COLUMN NUMBER 1.
           ACCEPT EEMPADDR AT COLUMN NUMBER 35.
           DISPLAY "ENTER PHONE :" AT COLUMN NUMBER 1.
           ACCEPT EPHONE AT COLUMN NUMBER 35.
           DISPLAY "ENTER DATE OF JOIN :" AT COLUMN NUMBER 1.
           ACCEPT EDOJ AT COLUMN NUMBER 35.
           DISPLAY "ENTER DIPLOMA :" AT COLUMN NUMBER 1.
           ACCEPT EDIP AT COLUMN NUMBER 35.
           DISPLAY "ENTER UG :" AT COLUMN NUMBER 1.
           ACCEPT EUG AT COLUMN NUMBER 35.
           DISPLAY "ENTER PG :" AT COLUMN NUMBER 1.
           ACCEPT EPG AT COLUMN NUMBER 35.
           DISPLAY "ENTER PROFESSIONAL QUALITY :" AT COLUMN NUMBER 1.
           ACCEPT EPROFQ AT COLUMN NUMBER 35.
           DISPLAY "ENTER SKILL SET :" AT COLUMN NUMBER 1.
           ACCEPT ESKILL AT COLUMN NUMBER 35.
           DISPLAY "ENTER GRADE NUMBER :" AT COLUMN NUMBER 1.
           ACCEPT EGRDNO AT COLUMN NUMBER 35.
           DISPLAY "ENTER BRANCH CODE :" AT COLUMN NUMBER 1.
           ACCEPT EBRNID AT COLUMN NUMBER 35.
           DISPLAY "ENTER DESIGNATION CODE :" AT COLUMN NUMBER 1.
           ACCEPT EDESID AT COLUMN NUMBER 35.
           WRITE EMPREC.
           CLOSE EMPFILE.
           GO TO MAIN-PARA.

       LEAVE-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           OPEN I-O LEAVEFILE.
           IF FSL = 30
              OPEN OUTPUT LEAVEFILE.
           DISPLAY "ENTER CODE :" AT COLUMN NUMBER 1.
           ACCEPT LEMPID AT COLUMN NUMBER 35.
           DISPLAY "ENTER FROM DATE :" AT COLUMN NUMBER 1.
           ACCEPT LFMDATE AT COLUMN NUMBER 35.
           DISPLAY "ENTER TO DATE :" AT COLUMN NUMBER 1.
           ACCEPT LTODATE AT COLUMN NUMBER 35.
           DISPLAY "ENTER LEAVE CATEGORY :" AT COLUMN NUMBER 1.
           ACCEPT LLEVCAT AT COLUMN NUMBER 35.
           WRITE LEAVEREC.
           CLOSE LEAVEFILE.
           GO TO MAIN-PARA.

       BRANCH-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           OPEN I-O BRANCHFILE.
           IF FSL = 30
              OPEN OUTPUT BRANCHFILE.
           DISPLAY "ENTER BRANCH CODE :" AT COLUMN NUMBER 1.
           ACCEPT BBRID AT COLUMN NUMBER 35.
           DISPLAY "ENTER BRANCH NAME :" AT COLUMN NUMBER 1.
           ACCEPT BBRNAME AT COLUMN NUMBER 35.
           DISPLAY "ENTER BRANCH ADDRESS :" AT COLUMN NUMBER 1.
           ACCEPT BBRADD AT COLUMN NUMBER 35.
           DISPLAY "ENTER PHONE :" AT COLUMN NUMBER 1.
           ACCEPT BBRPH AT COLUMN NUMBER 35.
           DISPLAY "ENTER E-MAIL :" AT COLUMN NUMBER 1.
           ACCEPT BEMAIL AT COLUMN NUMBER 35.
           DISPLAY "ENTER MANAGER NAME :" AT COLUMN NUMBER 1.
           ACCEPT BMGRNAME AT COLUMN NUMBER 35.
           WRITE BRANCHREC.
           CLOSE BRANCHFILE.
           GO TO MAIN-PARA.

       DESIGNATION-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           OPEN EXTEND DESIGNATIONFILE.
           DISPLAY "ENTER DESIGNATION CODE :" AT COLUMN NUMBER 1.
           ACCEPT DESID AT COLUMN NUMBER 35.
           DISPLAY "ENTER DESIGNATION :" AT COLUMN NUMBER 1.
           ACCEPT DESIGN AT COLUMN NUMBER 35.
           DISPLAY "ENTER DES IN SHORT :" AT COLUMN NUMBER 1.
           ACCEPT DESHRT AT COLUMN NUMBER 35.
           WRITE DESIGNATIONREC.
           CLOSE DESIGNATIONFILE.
           GO TO MAIN-PARA.

       DEPARTMENT-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           OPEN I-O DEPARTMENTFILE.
           IF FSDEP = 30
              OPEN OUTPUT DEPARTMENTFILE.
           DISPLAY "ENTER DEPARTMENT CODE :" AT COLUMN NUMBER 1.
           ACCEPT DEPCODE AT COLUMN NUMBER 35.
           DISPLAY "ENTER DEPARTMENT NAME :" AT COLUMN NUMBER 1.
           ACCEPT DEPNAME AT COLUMN NUMBER 35.
           WRITE DEPARTMENTREC.
           CLOSE DEPARTMENTFILE.
           GO TO MAIN-PARA.

       REVISION-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           OPEN I-O REVISIONFILE.
           IF FSR = 30
              OPEN OUTPUT REVISIONFILE.
           DISPLAY "ENTER REVISION CODE :" AT COLUMN NUMBER 1.
           ACCEPT RREVID AT COLUMN NUMBER 35.
           DISPLAY "ENTER EMPLOYEE CODE :" AT COLUMN NUMBER 1.
           ACCEPT REMPID AT COLUMN NUMBER 35.
           DISPLAY "ENTER DESIGNATION CODE :" AT COLUMN NUMBER 1.
           ACCEPT RDESCODE AT COLUMN NUMBER 35.
           DISPLAY "ENTER BASIC :" AT COLUMN NUMBER 1.
           ACCEPT RBASIC AT COLUMN NUMBER 35.
           DISPLAY "ENTER HRA :" AT COLUMN NUMBER 1.
           ACCEPT RHRA AT COLUMN NUMBER 35.
           DISPLAY "ENTER DPA :" AT COLUMN NUMBER 1.
           ACCEPT RDPA AT COLUMN NUMBER 35.
           DISPLAY "ENTER PPA :" AT COLUMN NUMBER 1.
           ACCEPT RPPA AT COLUMN NUMBER 35.
           DISPLAY "ENTER EDUCATIONAL ALLOWANCE :" AT COLUMN NUMBER 1.
           ACCEPT REDUA AT COLUMN NUMBER 35.
           DISPLAY "ENTER TECH AT COLUMN NUMBER 1. JOURNAL :".
           ACCEPT RTECHJR AT COLUMN NUMBER 35.
           DISPLAY "ENTER LUNCH ALLOWANCE :" AT COLUMN NUMBER 1.
           ACCEPT RLUNCHA AT COLUMN NUMBER 35.
           DISPLAY "ENTER CONVEYANCE :" AT COLUMN NUMBER 1.
           ACCEPT RCONVEY AT COLUMN NUMBER 35.
           DISPLAY "ENTER BUSINESS ATTIREMENT :" AT COLUMN NUMBER 1.
           ACCEPT RBUSATR AT COLUMN NUMBER 35.
           DISPLAY "ENTER LEAVE TRAVEL ALLOWANCE :" AT COLUMN NUMBER 1.
           ACCEPT RLTA AT COLUMN NUMBER 35.
           DISPLAY "ENTER PF :" AT COLUMN NUMBER 1.
           ACCEPT RPF AT COLUMN NUMBER 35.
           DISPLAY "ENTER ESI :" AT COLUMN NUMBER 1.
           ACCEPT RESI AT COLUMN NUMBER 35.
           DISPLAY "ENTER REVISED DATE :" AT COLUMN NUMBER 1.
           ACCEPT RREVDATE AT COLUMN NUMBER 35.
           WRITE REVISIONREC.
           CLOSE REVISIONFILE.
           GO TO MAIN-PARA.

       PAYMENT-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           OPEN I-O PAYMENTFILE.
           IF FSP = 30
              OPEN OUTPUT PAYMENTFILE.
           DISPLAY "ENTER EMPLOYEE CODE :" AT COLUMN NUMBER 1.
           ACCEPT PEMPID AT COLUMN NUMBER 35.
           DISPLAY "ENTER BASIC :" AT COLUMN NUMBER 1.
           ACCEPT PBASIC AT COLUMN NUMBER 35.
           DISPLAY "ENTER DA :" AT COLUMN NUMBER 1.
           ACCEPT PDA AT COLUMN NUMBER 35.
           DISPLAY "ENTER CCA :" AT COLUMN NUMBER 1.
           ACCEPT PCCA AT COLUMN NUMBER 35.
           DISPLAY "ENTER HRA :" AT COLUMN NUMBER 1.
           ACCEPT PHRA AT COLUMN NUMBER 35.
           DISPLAY "ENTER DPA :" AT COLUMN NUMBER 1.
           ACCEPT PDPA AT COLUMN NUMBER 35.
           DISPLAY "ENTER PPA :" AT COLUMN NUMBER 1.
           ACCEPT PPPA AT COLUMN NUMBER 35.
           DISPLAY "ENTER EDUCATIONAL ALLOWANCE :" AT COLUMN NUMBER 1.
           ACCEPT PEDUA AT COLUMN NUMBER 35.
           DISPLAY "ENTER TECH AT COLUMN NUMBER 1. JOURNAL :".
           ACCEPT PTECHJR AT COLUMN NUMBER 35.
           DISPLAY "ENTER LUNCH ALLOWANCE :" AT COLUMN NUMBER 1.
           ACCEPT PLUNCHA AT COLUMN NUMBER 35.
           DISPLAY "ENTER CONVEYANCE :" AT COLUMN NUMBER 1.
           ACCEPT PCONVEY AT COLUMN NUMBER 35.
           DISPLAY "ENTER BUSINESS ATTIREMENT :" AT COLUMN NUMBER 1.
           ACCEPT PBUSATR AT COLUMN NUMBER 35.
           DISPLAY "ENTER LEAVE TRAVEL ALLOWANCE :" AT COLUMN NUMBER 1.
           ACCEPT PLTA AT COLUMN NUMBER 35.
           DISPLAY "ENTER PF :" AT COLUMN NUMBER 1.
           ACCEPT PPF AT COLUMN NUMBER 35.
           DISPLAY "ENTER ESI :" AT COLUMN NUMBER 1.
           ACCEPT PESI AT COLUMN NUMBER 35.
           DISPLAY "ENTER GRATUITY :" AT COLUMN NUMBER 1.
           ACCEPT PGRTY AT COLUMN NUMBER 35.
           DISPLAY "ENTER PROFESSIONAL TAX :" AT COLUMN NUMBER 1.
           ACCEPT PPTAX AT COLUMN NUMBER 35.
           DISPLAY "ENTER INCOME TAX :" AT COLUMN NUMBER 1.
           ACCEPT PITAX AT COLUMN NUMBER 35.
           DISPLAY "ENTER LOAN :" AT COLUMN NUMBER 1.
           ACCEPT PLOAN AT COLUMN NUMBER 35.
           DISPLAY "ENTER LOAN DEDUCTION AMOUNT :" AT COLUMN NUMBER 1.
           ACCEPT PLOANDA AT COLUMN NUMBER 35.
           DISPLAY "ENTER OTHER DEDUCTION :" AT COLUMN NUMBER 1.
           ACCEPT POTHERD AT COLUMN NUMBER 35.
           DISPLAY "ENTER PERFORMANCE INCENTIVE :" AT COLUMN NUMBER 1.
           ACCEPT PPERINC AT COLUMN NUMBER 35.
           DISPLAY "ENTER MEDICAL REIMBURSEMENT :" AT COLUMN NUMBER 1.
           ACCEPT PMEDI AT COLUMN NUMBER 35.
           DISPLAY "ENTER BOOK REIMBURSEMENT :" AT COLUMN NUMBER 1.
           ACCEPT PBOOK AT COLUMN NUMBER 35.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           DISPLAY "ENTER ENTERTAINMENT :" AT COLUMN NUMBER 1.
           ACCEPT PENTER AT COLUMN NUMBER 35.
           DISPLAY "ENTER PHONE :" AT COLUMN NUMBER 1.
           ACCEPT PTPH AT COLUMN NUMBER 35.
           DISPLAY "ENTER HOUSE RELATED :" AT COLUMN NUMBER 1.
           ACCEPT PHOUSE AT COLUMN NUMBER 35.
           DISPLAY "ENTER VEHICLE MAINTENANCE :" AT COLUMN NUMBER 1.
           ACCEPT PVEHMAN AT COLUMN NUMBER 35.
           DISPLAY "ENTER CREDIT CARD :" AT COLUMN NUMBER 1.
           ACCEPT PCREDIT AT COLUMN NUMBER 35.
           DISPLAY "ENTER CLUB :" AT COLUMN NUMBER 1.
           ACCEPT PCLUB AT COLUMN NUMBER 35.
           DISPLAY "ENTER CLUB :" AT COLUMN NUMBER 1.
           ACCEPT PCLUB AT COLUMN NUMBER 35.
           DISPLAY "ENTER CLUB :" AT COLUMN NUMBER 1.
           ACCEPT PCLUB AT COLUMN NUMBER 35.
           DISPLAY "ENTER CASUAL LEAVE :" AT COLUMN NUMBER 1.
           ACCEPT PCL AT COLUMN NUMBER 35.
           DISPLAY "ENTER SICK LEAVE :" AT COLUMN NUMBER 1.
           ACCEPT PSL AT COLUMN NUMBER 35.
           DISPLAY "ENTER PAID LEAVE :" AT COLUMN NUMBER 1.
           ACCEPT PPL AT COLUMN NUMBER 35.
           DISPLAY "ENTER LEAVE LOSS OF PAY :" AT COLUMN NUMBER 1.
           ACCEPT PLLOP AT COLUMN NUMBER 35.
           DISPLAY "ENTER OTHER LEAVES :" AT COLUMN NUMBER 1.
           ACCEPT POTHERL AT COLUMN NUMBER 35.
           WRITE PAYMENTREC.
           CLOSE PAYMENTFILE.
           GO TO MAIN-PARA.

       CONFIRMATION-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           OPEN I-O CONFIRMATIONFILE.
           IF FSC = 30
              OPEN OUTPUT CONFIRMATIONFILE.
           DISPLAY "ENTER CONFIRMATION CODE :" AT COLUMN NUMBER 1.
           ACCEPT CCONID AT COLUMN NUMBER 35.
           DISPLAY "ENTER EMP CODE :" AT COLUMN NUMBER 1.
           ACCEPT CEMPID AT COLUMN NUMBER 35.
           DISPLAY "ENTER CONFIRMATION DATE :" AT COLUMN NUMBER 1.
           ACCEPT CCDATE AT COLUMN NUMBER 35.
           WRITE CONFIRMATIONREC.
           CLOSE CONFIRMATIONFILE.
           GO TO MAIN-PARA.

       GRADE-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           OPEN EXTEND GRADEFILE.
           DISPLAY "ENTER GRADE NO AT COLUMN NUMBER 1. :".
           ACCEPT GGRADE AT COLUMN NUMBER 35.
           DISPLAY "ENTER DESIGNATION :" AT COLUMN NUMBER 1.
           ACCEPT GDESIGN AT COLUMN NUMBER 35.
           WRITE GRADEREC.
           CLOSE GRADEFILE.
           GO TO MAIN-PARA.

       TRANSFER-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           OPEN I-O TRANSFERFILE.
           IF FST = 30
              OPEN OUTPUT TRANSFERFILE.
           DISPLAY "ENTER TRANSFER CODE :" AT COLUMN NUMBER 1.
           ACCEPT TTRFID AT COLUMN NUMBER 35.
           DISPLAY "ENTER EMP CODE :" AT COLUMN NUMBER 1.
           ACCEPT TEMPID AT COLUMN NUMBER 35.
           DISPLAY "ENTER OLD BRANCH CODE :" AT COLUMN NUMBER 1.
           ACCEPT TOBRID AT COLUMN NUMBER 35.
           DISPLAY "ENTER TRANSFER DATE :" AT COLUMN NUMBER 1.
           ACCEPT TTRFDT AT COLUMN NUMBER 35.
           WRITE TRANSFERREC.
           CLOSE TRANSFERFILE.
           GO TO MAIN-PARA.

       EMPPERSONAL-PARA.
           DISPLAY CLEAR-SCREEN AT COLUMN NUMBER 1.
           OPEN I-O EMPPERSONALFILE.
           IF FSEP = 30
              OPEN OUTPUT EMPPERSONALFILE.
           DISPLAY "ENTER EMP CODE :" AT COLUMN NUMBER 1.
           ACCEPT EPEMPID AT COLUMN NUMBER 35.
           DISPLAY "ENTER TEMP ADDRESS :" AT COLUMN NUMBER 1.
           ACCEPT EPTADD AT COLUMN NUMBER 35.
           DISPLAY "ENTER PHONE :" AT COLUMN NUMBER 1.
           ACCEPT EPTPH AT COLUMN NUMBER 35.
           DISPLAY "ENTER DOB :" AT COLUMN NUMBER 1.
           ACCEPT EPDOB AT COLUMN NUMBER 35.
           DISPLAY "ENTER POB :" AT COLUMN NUMBER 1.
           ACCEPT EPPOB AT COLUMN NUMBER 35.
           DISPLAY "ENTER LANGUAGE KNOWN :" AT COLUMN NUMBER 1.
           ACCEPT EPLANG AT COLUMN NUMBER 35.
           DISPLAY "ENTER BLOOD GROUP :" AT COLUMN NUMBER 1.
           ACCEPT EPBLOOD AT COLUMN NUMBER 35.
           DISPLAY "ENTER WEIGHT :" AT COLUMN NUMBER 1.
           ACCEPT EPWEIGHT AT COLUMN NUMBER 35.
           DISPLAY "ENTER HEIGHT :" AT COLUMN NUMBER 1.
           ACCEPT EPHEIGHT AT COLUMN NUMBER 35.
           DISPLAY "ENTER VISION :" AT COLUMN NUMBER 1.
           ACCEPT EPVISION AT COLUMN NUMBER 35.
           DISPLAY "ENTER FATHER'S NAME :" AT COLUMN NUMBER 1.
           ACCEPT EPFATHER AT COLUMN NUMBER 35.
           DISPLAY "ENTER DOB OF FATHER :" AT COLUMN NUMBER 1.
           ACCEPT EPDOBF AT COLUMN NUMBER 35.
           DISPLAY "ENTER MOTHER'S NAME :" AT COLUMN NUMBER 1.
           ACCEPT EPMOTHER AT COLUMN NUMBER 35.
           DISPLAY "ENTER DOB OF MOTHER :" AT COLUMN NUMBER 1.
           ACCEPT EPDOBM AT COLUMN NUMBER 35.
           DISPLAY "ENTER SPOUSE NAME :" AT COLUMN NUMBER 1.
           ACCEPT EPSPOUSE AT COLUMN NUMBER 35.
           DISPLAY "ENTER CHILD NAME :" AT COLUMN NUMBER 1.
           ACCEPT EPCHILD AT COLUMN NUMBER 35.
           DISPLAY "ENTER DOB OF CHILD :" AT COLUMN NUMBER 1.
           ACCEPT EPDOBC AT COLUMN NUMBER 35.
           WRITE EMPPERSONALREC.
           CLOSE EMPPERSONALFILE.
           GO TO MAIN-PARA.
           END PROGRAM EMP.
           END PROGRAM EMPREAD.
           END PROGRAM MAINHRMS.
