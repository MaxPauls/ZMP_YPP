************************************************************************
* Programmname...............: ZMP_PPFLEGE
* Autor......................: Markus Postler
* Firma......................: mindsquare AG
* Projekt....................:
* Aufgabe....................:
* Ansprechpartner Fachabt....:
* Erstellt am................: 27.05.2020 22:40:48
* Kopiert von................:
* Online/Batch/USER-EXIT ....:
* Funktionsbeschreibung .....:
************************************************************************

program zmp_ppflege.

tables: zmp_prospekt,
        zmp_angebot.

include zmp_ppflege_status_0100o01.

include zmp_ppflege_user_command_01i01.
