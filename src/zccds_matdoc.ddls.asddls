@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view for Material Document'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZCCDS_MATDOC as select from ZICDS_MATDOC
{
    key Ebeln,
    key Ebelp,
    RecordType,
    Werks,
    Bukrs,
    
    Waers,
    @Semantics.amount.currencyCode: 'Waers'
    Dmbtr,
    
    Meins,
    @Semantics.quantity.unitOfMeasure: 'Meins'
    Menge,
    
    Budat,
    Aedat,
    Mblnr,
    Mjahr,
    Zeile,
    Lfbja,
    Lfbnr,
    Lfpos,
    Bwart,
    Matnr,
    Lifnr,
    Blart
}
