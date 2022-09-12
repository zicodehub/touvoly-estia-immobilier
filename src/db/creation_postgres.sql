drop table visite;
drop table PAIEMENT;
drop table FACTURE;
drop table RESERVATION;
drop table LOGEMENT;
drop table PROPRIETAIRE;
drop table CLIENT;


CREATE TABLE client (
    id SERIAL PRIMARY KEY,
    cltnom varchar(50),
    cltprenom varchar(50),
    cltnaissance date,
    cltcontact varchar(30),
    cltprofession varchar(50),
    cltemail varchar(50)
);

CREATE TABLE proprietaire (
    id SERIAL PRIMARY KEY,
    gakou int,
    pronom varchar(50),
    proprenom varchar(50),
    prodateNaissance date,
    procontact varchar(30),
    proprofession varchar(50),
    proemail varchar(50)
);

CREATE TABLE logement (
    id SERIAL PRIMARY KEY,
    logement_proId int,
    prix int,
    logtype varchar(50),
    lot varchar(50),
    ilot varchar(50),
    nbrepiece int,
    parking varchar(50),
    cuisine varchar(50),
    ville varchar(50),
    pays varchar(50),
    disponibilite varchar(50),
    categorie varchar(50),
    constraint fk_proId foreign key (logement_proId)  references proprietaire(id)
);

CREATE TABLE reservation(
    id SERIAL PRIMARY KEY,
    reservation_cltId int,
    reservation_logId int,
    resdate date,
    constraint fk_client_Id foreign key (reservation_cltId)  references client(id),
    constraint fk_logement_Id foreign key (reservation_logId)  references logement(id)
);

CREATE TABLE facture (
    id SERIAL PRIMARY KEY,
    facture_resId int,
    someapayer int,
    statut varchar(50),
    datefact date,
    constraint fk_reservation_Id foreign key (facture_resId)  references reservation(id)
);

CREATE TABLE paiement (
    id SERIAL PRIMARY KEY,
    paiement_facId int,
    montant int,
    modepaie varchar(50),
    datepaie date,
    constraint fk_facture_Id foreign key (paiement_facId)  references facture(id)
);

CREATE TABLE visite (
    id SERIAL PRIMARY KEY,
    visite_resId int,
    statut varchar(50),
    datevisite date,
    constraint fk_reservation_visite_Id foreign key (visite_resId)  references reservation(id)
);
commit;