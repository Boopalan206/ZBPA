@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Recreating MATDOC CDS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZICDS_MATDOC_2 as select from matdoc
{
    key key1 as Key1,
    key key2 as Key2,
    key key3 as Key3,
    key key4 as Key4,
    key key5 as Key5,
    key key6 as Key6,
    ebeln as Ebeln,
    record_type as RecType,
    werks as Werks,
    bukrs as Bukrs,
    
    waers as Waers,
    @Semantics.amount.currencyCode: 'waers'
    dmbtr as Dmbtr,
    
    meins as Meins,
    @Semantics.quantity.unitOfMeasure: 'meins'
    menge as Menge,
    
    budat as Budat,
    aedat as Aedat,
    mblnr as Mblnr,
    mjahr as Mjahr,
    zeile as Zeile,
    ebelp as Ebelp,
    lfbja as Lfbja,
    lfbnr as Lfbnr,
    lfpos as Lfpos,
    bwart as Bwart,
    matnr as Matnr,
    lifnr as Lifnr,
    blart as Blart
}
