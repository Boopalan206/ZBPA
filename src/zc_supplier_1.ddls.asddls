@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supplier Odata service'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZC_Supplier_1 as select from I_Supplier
{
    key Supplier,
    SupplierAccountGroup,
    SupplierName,
    SupplierFullName,
    CreatedByUser,
    CreationDate,
    Region,
    OrganizationBPName1,
    OrganizationBPName2,
    CityName,
    PostalCode,
    StreetName,
    Country,
    SupplierLanguage,
    PhoneNumber1,
    TaxNumberType,
    BusinessType,
    BirthDate,
    PhoneNumber2,
    DeletionIndicator,
    SupplierPlant,
    /* Associations */
    _SupplierAccountGroup,
    _SupplierBankDetails,
    _SupplierCompany
}
