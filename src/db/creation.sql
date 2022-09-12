drop table visite;
drop table PAIEMENT;
drop table FACTURE;
drop table RESERVATION;
drop table LOGEMENT;
drop table PROPRIETAIRE;
drop table CLIENT;


CREATE TABLE client (
    cltId number(10),
    cltnom varchar2(50),
    cltprenom varchar2(50),
    cltnaissance date,
    cltcontact varchar2(30),
    cltprofession varchar2(50),
    cltemail varchar2(50),
    constraint pk_client_Id primary key(cltId)
);

CREATE TABLE proprietaire (
    proId number(10),
    pronom varchar2(50),
    proprenom varchar2(50),
    prodateNaissance date,
    procontact varchar2(30),
    proprofession varchar2(50),
    proemail varchar2(50),
    constraint pk_proprietaire_Id primary key(proId)
);

CREATE TABLE logement (
    logId number(8),
    logement_proId number(8),
    prix number(20),
    logtype varchar2(50),
    lot varchar2(50),
    ilot varchar2(50),
    nbrepiece number(8),
    parking varchar2(50),
    cuisine varchar2(50),
    ville varchar2(50),
    pays varchar2(50),
    disponibilite varchar2(50),
    categorie varchar2(50),
    constraint pk_logement_Id primary key(logId),
    constraint fk_proId foreign key (logement_proId)  references proprietaire(proId)
);

CREATE TABLE reservation(
    resId number(8),
    reservation_cltId number(8),
    reservation_logId number(8),
    resdate date,
    constraint pk_reservation_Id primary key(resId),
    constraint fk_client_Id foreign key (reservation_cltId)  references client(cltId),
    constraint fk_logement_Id foreign key (reservation_logId)  references logement(logId)
);

CREATE TABLE facture (
    facId number(10),
    facture_resId number(10),
    someapayer number(20),
    statut varchar2(50),
    datefact date,
    constraint pk_facture_Id primary key(facId),
    constraint fk_reservation_Id foreign key (facture_resId)  references reservation(resId)
);

CREATE TABLE paiement (
    paieId number(10),
    paiement_facId number (10),
    montant number(20),
    modepaie varchar2(50),
    datepaie date,
    constraint pk_paiement_Id primary key(paieId),
    constraint fk_facture_Id foreign key (paiement_facId)  references facture(facId)
);

CREATE TABLE visite (
    visiteId number(10),
    visite_resId number (10),
    statut varchar2(50),
    datevisite date,
    constraint pk_visite_Id primary key(visiteId),
    constraint fk_reservation_visite_Id foreign key (visite_resId)  references reservation(resId)
);
commit;