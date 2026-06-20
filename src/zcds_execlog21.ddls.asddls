@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Execution log cds'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@OData.publish: true
@OData.entitySet.name: 'ExecLogSet'

@UI : {
    headerInfo : { title: { type: #STANDARD, value: 'ID' }, typeName: 'Execution Log', typeNamePlural: 'Invoices Exec.Log' }
}

@ObjectModel.semanticKey: [ 'Id', 'Vendormail' ]
define root view entity ZCDS_EXECLOG21 as select from zexecution_log2
{
    @UI.facet: [ { id:              'ExecutionLog',
                       purpose:         #STANDARD,
                       type:            #IDENTIFICATION_REFERENCE,
                       label:           'Exec.Log',
                       position:        10 } ]
      @UI: {
        lineItem: [{ position: 10, importance: #HIGH }],
        identification: [{ position: 10, label : 'RecordID' }]
      }
      key id as ID,

      @UI: {
        identification: [{ position: 20, label : 'VendorName' }],
        selectionField: [{ position: 10 }],
        hidden: true
      }
      vendorname as VendorName,

      @UI: {
        lineItem: [{ position: 30 }],
        identification: [{ position: 30, label : 'Supplier E-Mail' }],
        selectionField: [{ position: 20 }]
      }
      vendormail as VendorMail,

      @UI: {
        lineItem: [{ position: 40 }],
        identification: [{ position: 40, label : 'Supplier Number' }],
        selectionField: [{ position: 30 }]
      }
      @Consumption.valueHelpDefinition: [{ entity : { name: 'ZCDS_EXECLOG21', element: 'Vendornumber' } }]
      @ObjectModel.text.element: [ 'Vendorname' ]
      vendornumber as VendorNumber,

      @UI: {
        lineItem: [{ position: 60 }],
        identification: [{ position: 60, label : 'Inv.Doc.Name' }]
      }
      mailinvdocname as Mailinvdocname,

      @UI: {
        lineItem: [{ position: 70 }],
        identification: [{ position: 70, label : 'Document Date' }],
        selectionField: [{ position: 40 }]
      }
      docdate as DocDate,

      @UI: {
        lineItem: [{ position: 80 }],
        identification: [{ position: 80, label : 'Invoice Number' }]
      }
      invoicenumber as InvoiceNumber,
      
      case invoicenumber
        when '' then 1
        else 3
      end as StatusCriticality,
 
      @UI: {
        lineItem: [{ position: 90, criticality: 'StatusCriticality' }],
        identification: [{ position: 90, label : 'Other Message', criticality: 'StatusCriticality' }]        
      }
      message as Message
}
