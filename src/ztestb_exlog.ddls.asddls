@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Execution log cds'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZTESTB_EXLOG as select from zexecution_log2
{
    key id as Id,
    vendorname as Vendorname,
    vendormail as Vendormail,
    vendornumber as Vendornumber,
    mailinvdocname as Mailinvdocname,
    docdate as Docdate,
    invoicenumber as Invoicenumber,
    message as Message
}
