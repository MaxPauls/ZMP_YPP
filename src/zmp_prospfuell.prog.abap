*&---------------------------------------------------------------------*
*& Report  ZMP_PROSPFUELL
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ZMP_PROSPFUELL.


*data gs_angebote type zmp_angebot.
data gs_prospekte type zmp_prospekt.

gs_prospekte-prospid = 1.
gs_prospekte-titel = 'Fun-Reisen'.
gs_prospekte-von = '20080903'.
gs_prospekte-bis = '20280903'.
insert into zmp_prospekt values gs_prospekte.
gs_prospekte-prospid = 2.
gs_prospekte-titel = 'Fachlicher Erlebnisspaß'.
gs_prospekte-von = '20080903'.
gs_prospekte-bis = '20280903'.
insert into zmp_prospekt values gs_prospekte.
gs_prospekte-prospid = 3.
gs_prospekte-titel = 'Nullprospekt'.
gs_prospekte-von = '20080903'.
gs_prospekte-bis = '20280903'.
insert into zmp_prospekt values gs_prospekte.

*gs_angebote-angebotid = 1.
*gs_angebote-prospid = 1.
*gs_angebote-carrid1 = 'AA'.
*gs_angebote-connid1 = '0017'.
*gs_angebote-carrid2 = 'AA'.
*gs_angebote-connid2 = '0064'.
*gs_angebote-beschreibung = 'Kein-Bock-Reise'.
*gs_angebote-preis = '666'.
*gs_angebote-waehrung = 'EUR'.
*gs_angebote-naechte = 3.
*gs_angebote-hotel = 'Satanas Lounge'.
*insert into zmp_angebot values gs_angebote.
*
*gs_angebote-angebotid = 2.
*gs_angebote-prospid = 1.
*gs_angebote-carrid1 = 'LH'.
*gs_angebote-connid1 = '0400'.
*gs_angebote-carrid2 = 'UA'.
*gs_angebote-connid2 = '3517'.
*gs_angebote-beschreibung = 'Müllreisen'.
*gs_angebote-preis = '2'.
*gs_angebote-waehrung = 'EUR'.
*gs_angebote-naechte = 3.
*gs_angebote-hotel = 'Muldenkippe 2'.
*insert into zmp_angebot values gs_angebote.
*
*gs_angebote-angebotid = 3.
*gs_angebote-prospid = 1.
*gs_angebote-carrid1 = 'AA'.
*gs_angebote-connid1 = '0017'.
*gs_angebote-carrid2 = 'AA'.
*gs_angebote-connid2 = '0064'.
*gs_angebote-beschreibung = 'Eroparadies'.
*gs_angebote-preis = '34543'.
*gs_angebote-waehrung = 'EUR'.
*gs_angebote-naechte = 3.
*gs_angebote-hotel = 'Thai and May'.
*gs_angebote-angebotid = 1.
*insert into zmp_angebot values gs_angebote.
*
*gs_angebote-angebotid = 4.
*gs_angebote-prospid = 2.
*gs_angebote-carrid1 = 'UA'.
*gs_angebote-connid1 = '3516'.
*gs_angebote-carrid2 = 'SQ'.
*gs_angebote-connid2 = '0015'.
*gs_angebote-beschreibung = 'SAP-Spaß- und Erlebnisreise'.
*gs_angebote-preis = '6546'.
*gs_angebote-waehrung = 'EUR'.
*gs_angebote-naechte = 3.
*gs_angebote-hotel = 'mindcube Hotel'.
*insert into zmp_angebot values gs_angebote.
*
*gs_angebote-angebotid = 5.
*gs_angebote-prospid = 2.
*gs_angebote-carrid1 = 'UA'.
*gs_angebote-connid1 = '0941'.
*gs_angebote-carrid2 = 'SQ'.
*gs_angebote-connid2 = '0002'.
*gs_angebote-beschreibung = 'ABAP-Abenteuerurlaub'.
*gs_angebote-preis = '66688'.
*gs_angebote-waehrung = 'EUR'.
*gs_angebote-naechte = 3.
*gs_angebote-hotel = 'Netweaver Stack Hotel'.
*insert into zmp_angebot values gs_angebote.
*
*gs_angebote-angebotid = 6.
*gs_angebote-prospid = 2.
*gs_angebote-carrid1 = 'UA'.
*gs_angebote-connid1 = '3516'.
*gs_angebote-carrid2 = 'SQ'.
*gs_angebote-connid2 = '0015'.
*gs_angebote-beschreibung = 'Transaktions-Travel'.
*gs_angebote-preis = '68866'.
*gs_angebote-waehrung = 'EUR'.
*gs_angebote-naechte = 3.
*gs_angebote-hotel = 'Dictionary Lounge'.
*insert into zmp_angebot values gs_angebote.
*
*gs_angebote-angebotid = 7.
*gs_angebote-prospid = 2.
*gs_angebote-carrid1 = 'UA'.
*gs_angebote-connid1 = '3516'.
*gs_angebote-carrid2 = 'SQ'.
*gs_angebote-connid2 = '0015'.
*gs_angebote-beschreibung = 'Surfabenteuer-Urlaub'.
*gs_angebote-preis = '666576'.
*gs_angebote-waehrung = 'EUR'.
*gs_angebote-naechte = 3.
*gs_angebote-hotel = 'Niklas Pradalounge'.
*insert into zmp_angebot values gs_angebote.
*
*gs_angebote-angebotid = 8.
*gs_angebote-prospid = 2.
*gs_angebote-carrid1 = 'DL'.
*gs_angebote-connid1 = '0106'.
*gs_angebote-carrid2 = 'SQ'.
*gs_angebote-connid2 = '0988'.
*gs_angebote-beschreibung = 'Military Camp'.
*gs_angebote-preis = '626456'.
*gs_angebote-waehrung = 'EUR'.
*gs_angebote-naechte = 3.
*gs_angebote-hotel = 'Maiks rote Wände'.
*insert into zmp_angebot values gs_angebote.
*
*gs_angebote-angebotid = 9.
*gs_angebote-prospid = 2.
*gs_angebote-carrid1 = 'UA'.
*gs_angebote-connid1 = '3516'.
*gs_angebote-carrid2 = 'SQ'.
*gs_angebote-connid2 = '0015'.
*gs_angebote-beschreibung = 'Katholischer Pfadfinderurlaub'.
*gs_angebote-preis = '121366'.
*gs_angebote-waehrung = 'EUR'.
*gs_angebote-naechte = 3.
*gs_angebote-hotel = 'Troostis Fahrradwerkstatt'.
*insert into zmp_angebot values gs_angebote.
