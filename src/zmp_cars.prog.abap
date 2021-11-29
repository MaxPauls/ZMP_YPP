*&---------------------------------------------------------------------*
*& Report  ZMP_CARS
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ZMP_CARS.


DATA: gt_firmenfahrzeuge TYPE ZMP_T_FAHRZEUGE,
      gs_wagen TYPE ZMP_Fahrzeug.

gs_wagen-hersteller = 'Volkswagen'.
gs_wagen-modell = 'passat'.
gs_wagen-leistung = 12.
gs_wagen-baujahr = 1800.
gs_wagen-fahrgestellnr = '1231231231'.
gs_wagen-tueren = 1.
INSERT gs_wagen INTO TABLE gt_firmenfahrzeuge.
CLEAR gs_wagen.


gs_wagen-hersteller = 'Volkswagen'.
gs_wagen-modell = 'Golf'.
gs_wagen-leistung = 13.
gs_wagen-baujahr = 1800.
gs_wagen-fahrgestellnr = '1231231232'.
gs_wagen-tueren = 1.

INSERT gs_wagen INTO TABLE gt_firmenfahrzeuge.
CLEAR gs_wagen.

gs_wagen-hersteller = 'Audi'.
gs_wagen-modell = 'A3'.
gs_wagen-leistung = 12.
gs_wagen-baujahr = 1800.
gs_wagen-fahrgestellnr = '1231231233'.
gs_wagen-tueren = 1.

INSERT gs_wagen INTO TABLE gt_firmenfahrzeuge.
CLEAR gs_wagen.

gs_wagen-hersteller = 'Traktor'.
gs_wagen-modell = '3005'.
gs_wagen-leistung = 30.
gs_wagen-baujahr = 1800.
gs_wagen-fahrgestellnr = '1231231234'.
gs_wagen-tueren = 1.

INSERT gs_wagen INTO TABLE gt_firmenfahrzeuge.
CLEAR gs_wagen.

DELETE gt_firmenfahrzeuge WHERE fahrgestellnr = '1231231233'.

LOOP AT gt_firmenfahrzeuge INTO gs_wagen.
WRITE: /'sy_tabix:', sy-tabix,
        /'Hersteller:', gs_wagen-hersteller,
       / 'modell:', gs_wagen-modell,
       / 'leistung:', gs_wagen-leistung,
       / 'Baujahr:', gs_wagen-baujahr,
       / 'Fahrgestellnr:', gs_wagen-fahrgestellnr,
       / 'Türen:', gs_wagen-tueren.
SKIP.
ENDLOOP.
