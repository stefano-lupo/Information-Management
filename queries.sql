/** List all offers from providers in category cleaning */
SELECT offer.title, offer.description, provider.name FROM offer 
inner join provider on offer.fk_provider=provider.id