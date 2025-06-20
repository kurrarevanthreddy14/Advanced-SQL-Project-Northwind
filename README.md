# Advanced SQL Analysis of the Northwind Database

## Project Objective
This project demonstrates proficiency in advanced SQL by querying the classic Northwind relational database. The goal was to extract actionable business insights by answering a wide range of business questions related to customers, employees, orders, and products. The queries showcase a range of SQL techniques including multi-table JOINs, LEFT JOINs, aggregate functions with GROUP BY and HAVING, and conditional logic with CASE statements.

## Dataset
This analysis uses the standard **Northwind** sample database, which models the sales data for a fictional specialty foods import/export company called "Northwind Traders." The database includes interconnected tables for `Customers`, `Orders`, `Employees`, `Products`, `Suppliers`, and more.

## Tools Used
* **Database:** SQLite
* **Querying Tool:** DB Browser for SQLite

---

## Table of Contents
1.  [Customer and Employee per Order](#1-customer-and-employee-per-order)
2.  [Products from a Specific Supplier](#2-products-from-a-specific-supplier)
3.  [Late Shipments](#3-late-shipments)
4.  [Total Cost per Order](#4-total-cost-per-order)
5.  [Customers with No Orders](#5-customers-with-no-orders)
6.  [Top-Performing Employees by Order Volume](#6-top-performing-employees-by-order-volume)
7.  [Overall Order Date Range](#7-overall-order-date-range)
8.  [Quarterly Order Summary](#8-quarterly-order-summary)

---

## SQL Analysis: Business Questions & Queries

This project answers eight key business questions, moving from basic joins to more complex aggregations and conditional logic.

### 1. Customer and Employee per Order
* **Objective:** To create a consolidated view of every order for reporting purposes.
* **Technique:** A three-table `INNER JOIN` is used to link the `Orders`, `Customers`, and `Employees` tables on their respective ID keys.

```sql
SELECT
    o.OrderID,
    c.CompanyName,
    e.FirstName,
    e.LastName
FROM
    Orders o
INNER JOIN
    Customers c ON o.CustomerID = c.CustomerID
INNER JOIN
    Employees e ON o.EmployeeID = e.EmployeeID;
```
* **Result :**
OrderId	CompanyName	FirstName	LastName
10248	Vins et alcools Chevalier	Steven	Buchanan
10249	Toms Spezialitäten	Michael	Suyama
10250	Hanari Carnes	Margaret	Peacock
10251	Victuailles en stock	Janet	Leverling
10252	Suprêmes délices	Margaret	Peacock
10253	Hanari Carnes	Janet	Leverling
10254	Chop-suey Chinese	Steven	Buchanan
10255	Richter Supermarkt	Anne	Dodsworth
10256	Wellington Importadora	Janet	Leverling
10257	HILARION-Abastos	Margaret	Peacock
10258	Ernst Handel	Nancy	Davolio
10259	Centro comercial Moctezuma	Margaret	Peacock
10260	Ottilies Käseladen	Margaret	Peacock
10261	Que Delícia	Margaret	Peacock
10262	Rattlesnake Canyon Grocery	Laura	Callahan
10263	Ernst Handel	Anne	Dodsworth
10264	Folk och fä HB	Michael	Suyama
10265	Blondesddsl père et fils	Andrew	Fuller
10266	Wartian Herkku	Janet	Leverling
10267	Frankenversand	Margaret	Peacock
10268	GROSELLA-Restaurante	Laura	Callahan
10269	White Clover Markets	Steven	Buchanan
10270	Wartian Herkku	Nancy	Davolio
10271	Split Rail Beer & Ale	Michael	Suyama
10272	Rattlesnake Canyon Grocery	Michael	Suyama
10273	QUICK-Stop	Janet	Leverling
10274	Vins et alcools Chevalier	Michael	Suyama
10275	Magazzini Alimentari Riuniti	Nancy	Davolio
10276	Tortuga Restaurante	Laura	Callahan
10277	Morgenstern Gesundkost	Andrew	Fuller
10278	Berglunds snabbköp	Laura	Callahan
10279	Lehmanns Marktstand	Laura	Callahan
10280	Berglunds snabbköp	Andrew	Fuller
10281	Romero y tomillo	Margaret	Peacock
10282	Romero y tomillo	Margaret	Peacock
10283	LILA-Supermercado	Janet	Leverling
10284	Lehmanns Marktstand	Margaret	Peacock
10285	QUICK-Stop	Nancy	Davolio
10286	QUICK-Stop	Laura	Callahan
10287	Ricardo Adocicados	Laura	Callahan
10288	Reggiani Caseifici	Margaret	Peacock
10289	B's Beverages	Robert	King
10290	Comércio Mineiro	Laura	Callahan
10291	Que Delícia	Michael	Suyama
10292	Tradição Hipermercados	Nancy	Davolio
10293	Tortuga Restaurante	Nancy	Davolio
10294	Rattlesnake Canyon Grocery	Margaret	Peacock
10295	Vins et alcools Chevalier	Andrew	Fuller
10296	LILA-Supermercado	Michael	Suyama
10297	Blondesddsl père et fils	Steven	Buchanan
10298	Hungry Owl All-Night Grocers	Michael	Suyama
10299	Ricardo Adocicados	Margaret	Peacock
10300	Magazzini Alimentari Riuniti	Andrew	Fuller
10301	Die Wandernde Kuh	Laura	Callahan
10302	Suprêmes délices	Margaret	Peacock
10303	Godos Cocina Típica	Robert	King
10304	Tortuga Restaurante	Nancy	Davolio
10305	Old World Delicatessen	Laura	Callahan
10306	Romero y tomillo	Nancy	Davolio
10307	Lonesome Pine Restaurant	Andrew	Fuller
10308	Ana Trujillo Emparedados y helados	Robert	King
10309	Hungry Owl All-Night Grocers	Janet	Leverling
10310	The Big Cheese	Laura	Callahan
10311	Du monde entier	Nancy	Davolio
10312	Die Wandernde Kuh	Andrew	Fuller
10313	QUICK-Stop	Andrew	Fuller
10314	Rattlesnake Canyon Grocery	Nancy	Davolio
10315	Island Trading	Margaret	Peacock
10316	Rattlesnake Canyon Grocery	Nancy	Davolio
10317	Lonesome Pine Restaurant	Michael	Suyama
10318	Island Trading	Laura	Callahan
10319	Tortuga Restaurante	Robert	King
10320	Wartian Herkku	Steven	Buchanan
10321	Island Trading	Janet	Leverling
10322	Pericles Comidas clásicas	Robert	King
10323	Königlich Essen	Margaret	Peacock
10324	Save-a-lot Markets	Anne	Dodsworth
10325	Königlich Essen	Nancy	Davolio
10326	Bólido Comidas preparadas	Margaret	Peacock
10327	Folk och fä HB	Andrew	Fuller
10328	Furia Bacalhau e Frutos do Mar	Margaret	Peacock
10329	Split Rail Beer & Ale	Margaret	Peacock
10330	LILA-Supermercado	Janet	Leverling
10331	Bon app'	Anne	Dodsworth
10332	Mère Paillarde	Janet	Leverling
10333	Wartian Herkku	Steven	Buchanan
10334	Victuailles en stock	Laura	Callahan
10335	Hungry Owl All-Night Grocers	Robert	King
10336	Princesa Isabel Vinhos	Robert	King
10337	Frankenversand	Margaret	Peacock
10338	Old World Delicatessen	Margaret	Peacock
10339	Mère Paillarde	Andrew	Fuller
10340	Bon app'	Nancy	Davolio
10341	Simons bistro	Robert	King
10342	Frankenversand	Margaret	Peacock
10343	Lehmanns Marktstand	Margaret	Peacock
10344	White Clover Markets	Margaret	Peacock
10345	QUICK-Stop	Andrew	Fuller
10346	Rattlesnake Canyon Grocery	Janet	Leverling
10347	Familia Arquibaldo	Margaret	Peacock
10348	Die Wandernde Kuh	Margaret	Peacock
10349	Split Rail Beer & Ale	Robert	King
10350	La maison d'Asie	Michael	Suyama
10351	Ernst Handel	Nancy	Davolio
10352	Furia Bacalhau e Frutos do Mar	Janet	Leverling
10353	Piccolo und mehr	Robert	King
10354	Pericles Comidas clásicas	Laura	Callahan
10355	Around the Horn	Michael	Suyama
10356	Die Wandernde Kuh	Michael	Suyama
10357	LILA-Supermercado	Nancy	Davolio
10358	La maison d'Asie	Steven	Buchanan
10359	Seven Seas Imports	Steven	Buchanan
10360	Blondesddsl père et fils	Margaret	Peacock
10361	QUICK-Stop	Nancy	Davolio
10362	Bon app'	Janet	Leverling
10363	Drachenblut Delikatessen	Margaret	Peacock
10364	Eastern Connection	Nancy	Davolio
10365	Antonio Moreno Taquería	Janet	Leverling
10366	Galería del gastrónomo	Laura	Callahan
10367	Vaffeljernet	Robert	King
10368	Ernst Handel	Andrew	Fuller
10369	Split Rail Beer & Ale	Laura	Callahan
10370	Chop-suey Chinese	Michael	Suyama
10371	La maison d'Asie	Nancy	Davolio
10372	Queen Cozinha	Steven	Buchanan
10373	Hungry Owl All-Night Grocers	Margaret	Peacock
10374	Wolski  Zajazd	Nancy	Davolio
10375	Hungry Coyote Import Store	Janet	Leverling
10376	Mère Paillarde	Nancy	Davolio
10377	Seven Seas Imports	Nancy	Davolio
10378	Folk och fä HB	Steven	Buchanan
10379	Que Delícia	Andrew	Fuller
10380	Hungry Owl All-Night Grocers	Laura	Callahan
10381	LILA-Supermercado	Janet	Leverling
10382	Ernst Handel	Margaret	Peacock
10383	Around the Horn	Laura	Callahan
10384	Berglunds snabbköp	Janet	Leverling
10385	Split Rail Beer & Ale	Nancy	Davolio
10386	Familia Arquibaldo	Anne	Dodsworth
10387	Santé Gourmet	Nancy	Davolio
10388	Seven Seas Imports	Andrew	Fuller
10389	Bottom-Dollar Markets	Margaret	Peacock
10390	Ernst Handel	Michael	Suyama
10391	Drachenblut Delikatessen	Janet	Leverling
10392	Piccolo und mehr	Andrew	Fuller
10393	Save-a-lot Markets	Nancy	Davolio
10394	Hungry Coyote Import Store	Nancy	Davolio
10395	HILARION-Abastos	Michael	Suyama
10396	Frankenversand	Nancy	Davolio
10397	Princesa Isabel Vinhos	Steven	Buchanan
10398	Save-a-lot Markets	Andrew	Fuller
10399	Vaffeljernet	Laura	Callahan
10400	Eastern Connection	Nancy	Davolio
10401	Rattlesnake Canyon Grocery	Nancy	Davolio
10402	Ernst Handel	Laura	Callahan
10403	Ernst Handel	Margaret	Peacock
10404	Magazzini Alimentari Riuniti	Andrew	Fuller
10405	LINO-Delicateses	Nancy	Davolio
10406	Queen Cozinha	Robert	King
10407	Ottilies Käseladen	Andrew	Fuller
10408	Folies gourmandes	Laura	Callahan
10409	Océano Atlántico Ltda.	Janet	Leverling
10410	Bottom-Dollar Markets	Janet	Leverling
10411	Bottom-Dollar Markets	Anne	Dodsworth
10412	Wartian Herkku	Laura	Callahan
10413	La maison d'Asie	Janet	Leverling
10414	Familia Arquibaldo	Andrew	Fuller
10415	Hungry Coyote Import Store	Janet	Leverling
10416	Wartian Herkku	Laura	Callahan
10417	Simons bistro	Margaret	Peacock
10418	QUICK-Stop	Margaret	Peacock
10419	Richter Supermarkt	Margaret	Peacock
10420	Wellington Importadora	Janet	Leverling
10421	Que Delícia	Laura	Callahan
10422	Franchi S.p.A.	Andrew	Fuller
10423	Gourmet Lanchonetes	Michael	Suyama
10424	Mère Paillarde	Robert	King
10425	La maison d'Asie	Michael	Suyama
10426	Galería del gastrónomo	Margaret	Peacock
10427	Piccolo und mehr	Margaret	Peacock
10428	Reggiani Caseifici	Robert	King
10429	Hungry Owl All-Night Grocers	Janet	Leverling
10430	Ernst Handel	Margaret	Peacock
10431	Bottom-Dollar Markets	Margaret	Peacock
10432	Split Rail Beer & Ale	Janet	Leverling
10433	Princesa Isabel Vinhos	Janet	Leverling
10434	Folk och fä HB	Janet	Leverling
10435	Consolidated Holdings	Laura	Callahan
10436	Blondesddsl père et fils	Janet	Leverling
10437	Wartian Herkku	Laura	Callahan
10438	Toms Spezialitäten	Janet	Leverling
10439	Mère Paillarde	Michael	Suyama
10440	Save-a-lot Markets	Margaret	Peacock
10441	Old World Delicatessen	Janet	Leverling
10442	Ernst Handel	Janet	Leverling
10443	Reggiani Caseifici	Laura	Callahan
10444	Berglunds snabbköp	Janet	Leverling
10445	Berglunds snabbköp	Janet	Leverling
10446	Toms Spezialitäten	Michael	Suyama
10447	Ricardo Adocicados	Margaret	Peacock
10448	Rancho grande	Margaret	Peacock
10449	Blondesddsl père et fils	Janet	Leverling
10450	Victuailles en stock	Laura	Callahan
10451	QUICK-Stop	Margaret	Peacock
10452	Save-a-lot Markets	Laura	Callahan
10453	Around the Horn	Nancy	Davolio
10454	La maison d'Asie	Margaret	Peacock
10455	Wartian Herkku	Laura	Callahan
10456	Königlich Essen	Laura	Callahan
10457	Königlich Essen	Andrew	Fuller
10458	Suprêmes délices	Robert	King
10459	Victuailles en stock	Margaret	Peacock
10460	Folk och fä HB	Laura	Callahan
10461	LILA-Supermercado	Nancy	Davolio
10462	Consolidated Holdings	Andrew	Fuller
10463	Suprêmes délices	Steven	Buchanan
10464	Furia Bacalhau e Frutos do Mar	Margaret	Peacock
10465	Vaffeljernet	Nancy	Davolio
10466	Comércio Mineiro	Margaret	Peacock
10467	Magazzini Alimentari Riuniti	Laura	Callahan
10468	Königlich Essen	Janet	Leverling
10469	White Clover Markets	Nancy	Davolio
10470	Bon app'	Margaret	Peacock
10471	B's Beverages	Andrew	Fuller
10472	Seven Seas Imports	Laura	Callahan
10473	Island Trading	Nancy	Davolio
10474	Pericles Comidas clásicas	Steven	Buchanan
10475	Suprêmes délices	Anne	Dodsworth
10476	HILARION-Abastos	Laura	Callahan
10477	Princesa Isabel Vinhos	Steven	Buchanan
10478	Victuailles en stock	Andrew	Fuller
10479	Rattlesnake Canyon Grocery	Janet	Leverling
10480	Folies gourmandes	Michael	Suyama
10481	Ricardo Adocicados	Laura	Callahan
10482	Lazy K Kountry Store	Nancy	Davolio
10483	White Clover Markets	Robert	King
10484	B's Beverages	Janet	Leverling
10485	LINO-Delicateses	Margaret	Peacock
10486	HILARION-Abastos	Nancy	Davolio
10487	Queen Cozinha	Andrew	Fuller
10488	Frankenversand	Laura	Callahan
10489	Piccolo und mehr	Michael	Suyama
10490	HILARION-Abastos	Robert	King
10491	Furia Bacalhau e Frutos do Mar	Laura	Callahan
10492	Bottom-Dollar Markets	Janet	Leverling
10493	La maison d'Asie	Margaret	Peacock
10494	Comércio Mineiro	Margaret	Peacock
10495	Laughing Bacchus Wine Cellars	Janet	Leverling
10496	Tradição Hipermercados	Robert	King
10497	Lehmanns Marktstand	Robert	King
10498	HILARION-Abastos	Laura	Callahan
10499	LILA-Supermercado	Margaret	Peacock
10500	La maison d'Asie	Michael	Suyama
10501	Blauer See Delikatessen	Anne	Dodsworth
10502	Pericles Comidas clásicas	Andrew	Fuller
10503	Hungry Owl All-Night Grocers	Michael	Suyama
10504	White Clover Markets	Margaret	Peacock
10505	Mère Paillarde	Janet	Leverling
10506	Königlich Essen	Anne	Dodsworth
10507	Antonio Moreno Taquería	Robert	King
10508	Ottilies Käseladen	Nancy	Davolio
10509	Blauer See Delikatessen	Margaret	Peacock
10510	Save-a-lot Markets	Michael	Suyama
10511	Bon app'	Margaret	Peacock
10512	Familia Arquibaldo	Robert	King
10513	Die Wandernde Kuh	Robert	King
10514	Ernst Handel	Janet	Leverling
10515	QUICK-Stop	Andrew	Fuller
10516	Hungry Owl All-Night Grocers	Andrew	Fuller
10517	North/South	Janet	Leverling
10518	Tortuga Restaurante	Margaret	Peacock
10519	Chop-suey Chinese	Michael	Suyama
10520	Santé Gourmet	Robert	King
10521	Cactus Comidas para llevar	Laura	Callahan
10522	Lehmanns Marktstand	Margaret	Peacock
10523	Seven Seas Imports	Robert	King
10524	Berglunds snabbköp	Nancy	Davolio
10525	Bon app'	Nancy	Davolio
10526	Wartian Herkku	Margaret	Peacock
10527	QUICK-Stop	Robert	King
10528	Great Lakes Food Market	Michael	Suyama
10529	Maison Dewey	Steven	Buchanan
10530	Piccolo und mehr	Janet	Leverling
10531	Océano Atlántico Ltda.	Robert	King
10532	Eastern Connection	Robert	King
10533	Folk och fä HB	Laura	Callahan
10534	Lehmanns Marktstand	Laura	Callahan
10535	Antonio Moreno Taquería	Margaret	Peacock
10536	Lehmanns Marktstand	Janet	Leverling
10537	Richter Supermarkt	Nancy	Davolio
10538	B's Beverages	Anne	Dodsworth
10539	B's Beverages	Michael	Suyama
10540	QUICK-Stop	Janet	Leverling
10541	Hanari Carnes	Andrew	Fuller
10542	Königlich Essen	Nancy	Davolio
10543	LILA-Supermercado	Laura	Callahan
10544	Lonesome Pine Restaurant	Margaret	Peacock
10545	Lazy K Kountry Store	Laura	Callahan
10546	Victuailles en stock	Nancy	Davolio
10547	Seven Seas Imports	Janet	Leverling
10548	Toms Spezialitäten	Janet	Leverling
10549	QUICK-Stop	Steven	Buchanan
10550	Godos Cocina Típica	Robert	King
10551	Furia Bacalhau e Frutos do Mar	Margaret	Peacock
10552	HILARION-Abastos	Andrew	Fuller
10553	Wartian Herkku	Andrew	Fuller
10554	Ottilies Käseladen	Margaret	Peacock
10555	Save-a-lot Markets	Michael	Suyama
10556	Simons bistro	Andrew	Fuller
10557	Lehmanns Marktstand	Anne	Dodsworth
10558	Around the Horn	Nancy	Davolio
10559	Blondesddsl père et fils	Michael	Suyama
10560	Frankenversand	Laura	Callahan
10561	Folk och fä HB	Andrew	Fuller
10562	Reggiani Caseifici	Nancy	Davolio
10563	Ricardo Adocicados	Andrew	Fuller
10564	Rattlesnake Canyon Grocery	Margaret	Peacock
10565	Mère Paillarde	Laura	Callahan
10566	Blondesddsl père et fils	Anne	Dodsworth
10567	Hungry Owl All-Night Grocers	Nancy	Davolio
10568	Galería del gastrónomo	Janet	Leverling
10569	Rattlesnake Canyon Grocery	Steven	Buchanan
10570	Mère Paillarde	Janet	Leverling
10571	Ernst Handel	Laura	Callahan
10572	Berglunds snabbköp	Janet	Leverling
10573	Antonio Moreno Taquería	Robert	King
10574	Trail's Head Gourmet Provisioners	Margaret	Peacock
10575	Morgenstern Gesundkost	Steven	Buchanan
10576	Tortuga Restaurante	Janet	Leverling
10577	Trail's Head Gourmet Provisioners	Anne	Dodsworth
10578	B's Beverages	Margaret	Peacock
10579	Let's Stop N Shop	Nancy	Davolio
10580	Ottilies Käseladen	Margaret	Peacock
10581	Familia Arquibaldo	Janet	Leverling
10582	Blauer See Delikatessen	Janet	Leverling
10583	Wartian Herkku	Andrew	Fuller
10584	Blondesddsl père et fils	Margaret	Peacock
10585	Wellington Importadora	Robert	King
10586	Reggiani Caseifici	Anne	Dodsworth
10587	Que Delícia	Nancy	Davolio
10588	QUICK-Stop	Andrew	Fuller
10589	Great Lakes Food Market	Laura	Callahan
10590	Mère Paillarde	Margaret	Peacock
10591	Vaffeljernet	Nancy	Davolio
10592	Lehmanns Marktstand	Janet	Leverling
10593	Lehmanns Marktstand	Robert	King
10594	Old World Delicatessen	Janet	Leverling
10595	Ernst Handel	Andrew	Fuller
10596	White Clover Markets	Laura	Callahan
10597	Piccolo und mehr	Robert	King
10598	Rattlesnake Canyon Grocery	Nancy	Davolio
10599	B's Beverages	Michael	Suyama
10600	Hungry Coyote Import Store	Margaret	Peacock
10601	HILARION-Abastos	Robert	King
10602	Vaffeljernet	Laura	Callahan
10603	Save-a-lot Markets	Laura	Callahan
10604	Furia Bacalhau e Frutos do Mar	Nancy	Davolio
10605	Mère Paillarde	Nancy	Davolio
10606	Tradição Hipermercados	Margaret	Peacock
10607	Save-a-lot Markets	Steven	Buchanan
10608	Toms Spezialitäten	Margaret	Peacock
10609	Du monde entier	Robert	King
10610	La maison d'Asie	Laura	Callahan
10611	Wolski  Zajazd	Michael	Suyama
10612	Save-a-lot Markets	Nancy	Davolio
10613	HILARION-Abastos	Margaret	Peacock
10614	Blauer See Delikatessen	Laura	Callahan
10615	Wilman Kala	Andrew	Fuller
10616	Great Lakes Food Market	Nancy	Davolio
10617	Great Lakes Food Market	Margaret	Peacock
10618	Mère Paillarde	Nancy	Davolio
10619	Mère Paillarde	Janet	Leverling
10620	Laughing Bacchus Wine Cellars	Andrew	Fuller
10621	Island Trading	Margaret	Peacock
10622	Ricardo Adocicados	Margaret	Peacock
10623	Frankenversand	Laura	Callahan
10624	The Cracker Box	Margaret	Peacock
10625	Ana Trujillo Emparedados y helados	Janet	Leverling
10626	Berglunds snabbköp	Nancy	Davolio
10627	Save-a-lot Markets	Laura	Callahan
10628	Blondesddsl père et fils	Margaret	Peacock
10629	Godos Cocina Típica	Margaret	Peacock
10630	Königlich Essen	Nancy	Davolio
10631	La maison d'Asie	Laura	Callahan
10632	Die Wandernde Kuh	Laura	Callahan
10633	Ernst Handel	Robert	King
10634	Folies gourmandes	Margaret	Peacock
10635	Magazzini Alimentari Riuniti	Laura	Callahan
10636	Wartian Herkku	Margaret	Peacock
10637	Queen Cozinha	Michael	Suyama
10638	LINO-Delicateses	Janet	Leverling
10639	Santé Gourmet	Robert	King
10640	Die Wandernde Kuh	Margaret	Peacock
10641	HILARION-Abastos	Margaret	Peacock
10642	Simons bistro	Robert	King
10643	Alfreds Futterkiste	Michael	Suyama
10644	Wellington Importadora	Janet	Leverling
10645	Hanari Carnes	Margaret	Peacock
10646	Hungry Owl All-Night Grocers	Anne	Dodsworth
10647	Que Delícia	Margaret	Peacock
10648	Ricardo Adocicados	Steven	Buchanan
10649	Maison Dewey	Steven	Buchanan
10650	Familia Arquibaldo	Steven	Buchanan
10651	Die Wandernde Kuh	Laura	Callahan
10652	Gourmet Lanchonetes	Margaret	Peacock
10653	Frankenversand	Nancy	Davolio
10654	Berglunds snabbköp	Steven	Buchanan
10655	Reggiani Caseifici	Nancy	Davolio
10656	Great Lakes Food Market	Michael	Suyama
10657	Save-a-lot Markets	Andrew	Fuller
10658	QUICK-Stop	Margaret	Peacock
10659	Queen Cozinha	Robert	King
10660	Hungry Coyote Import Store	Laura	Callahan
10661	Hungry Owl All-Night Grocers	Robert	King
10662	Lonesome Pine Restaurant	Janet	Leverling
10663	Bon app'	Andrew	Fuller
10664	Furia Bacalhau e Frutos do Mar	Nancy	Davolio
10665	Lonesome Pine Restaurant	Nancy	Davolio
10666	Richter Supermarkt	Robert	King
10667	Ernst Handel	Robert	King
10668	Die Wandernde Kuh	Nancy	Davolio
10669	Simons bistro	Andrew	Fuller
10670	Frankenversand	Margaret	Peacock
10671	France restauration	Nancy	Davolio
10672	Berglunds snabbköp	Anne	Dodsworth
10673	Wilman Kala	Andrew	Fuller
10674	Island Trading	Margaret	Peacock
10675	Frankenversand	Steven	Buchanan
10676	Tortuga Restaurante	Andrew	Fuller
10677	Antonio Moreno Taquería	Nancy	Davolio
10678	Save-a-lot Markets	Robert	King
10679	Blondesddsl père et fils	Laura	Callahan
10680	Old World Delicatessen	Nancy	Davolio
10681	Great Lakes Food Market	Janet	Leverling
10682	Antonio Moreno Taquería	Janet	Leverling
10683	Du monde entier	Andrew	Fuller
10684	Ottilies Käseladen	Janet	Leverling
10685	Gourmet Lanchonetes	Margaret	Peacock
10686	Piccolo und mehr	Andrew	Fuller
10687	Hungry Owl All-Night Grocers	Anne	Dodsworth
10688	Vaffeljernet	Margaret	Peacock
10689	Berglunds snabbköp	Nancy	Davolio
10690	Hanari Carnes	Nancy	Davolio
10691	QUICK-Stop	Andrew	Fuller
10692	Alfreds Futterkiste	Margaret	Peacock
10693	White Clover Markets	Janet	Leverling
10694	QUICK-Stop	Laura	Callahan
10695	Wilman Kala	Robert	King
10696	White Clover Markets	Laura	Callahan
10697	LINO-Delicateses	Janet	Leverling
10698	Ernst Handel	Margaret	Peacock
10699	Morgenstern Gesundkost	Janet	Leverling
10700	Save-a-lot Markets	Janet	Leverling
10701	Hungry Owl All-Night Grocers	Michael	Suyama
10702	Alfreds Futterkiste	Margaret	Peacock
10703	Folk och fä HB	Michael	Suyama
10704	Queen Cozinha	Michael	Suyama
10705	HILARION-Abastos	Anne	Dodsworth
10706	Old World Delicatessen	Laura	Callahan
10707	Around the Horn	Margaret	Peacock
10708	The Big Cheese	Michael	Suyama
10709	Gourmet Lanchonetes	Nancy	Davolio
10710	Franchi S.p.A.	Nancy	Davolio
10711	Save-a-lot Markets	Steven	Buchanan
10712	Hungry Owl All-Night Grocers	Janet	Leverling
10713	Save-a-lot Markets	Nancy	Davolio
10714	Save-a-lot Markets	Steven	Buchanan
10715	Bon app'	Janet	Leverling
10716	Rancho grande	Margaret	Peacock
10717	Frankenversand	Nancy	Davolio
10718	Königlich Essen	Nancy	Davolio
10719	Let's Stop N Shop	Laura	Callahan
10720	Que Delícia	Laura	Callahan
10721	QUICK-Stop	Steven	Buchanan
10722	Save-a-lot Markets	Laura	Callahan
10723	White Clover Markets	Janet	Leverling
10724	Mère Paillarde	Laura	Callahan
10725	Familia Arquibaldo	Margaret	Peacock
10726	Eastern Connection	Margaret	Peacock
10727	Reggiani Caseifici	Andrew	Fuller
10728	Queen Cozinha	Margaret	Peacock
10729	LINO-Delicateses	Laura	Callahan
10730	Bon app'	Steven	Buchanan
10731	Chop-suey Chinese	Robert	King
10732	Bon app'	Janet	Leverling
10733	Berglunds snabbköp	Nancy	Davolio
10734	Gourmet Lanchonetes	Andrew	Fuller
10735	Let's Stop N Shop	Michael	Suyama
10736	Hungry Owl All-Night Grocers	Anne	Dodsworth
10737	Vins et alcools Chevalier	Andrew	Fuller
10738	Spécialités du monde	Andrew	Fuller
10739	Vins et alcools Chevalier	Janet	Leverling
10740	White Clover Markets	Margaret	Peacock
10741	Around the Horn	Margaret	Peacock
10742	Bottom-Dollar Markets	Janet	Leverling
10743	Around the Horn	Nancy	Davolio
10744	Vaffeljernet	Michael	Suyama
10745	QUICK-Stop	Anne	Dodsworth
10746	Chop-suey Chinese	Nancy	Davolio
10747	Piccolo und mehr	Michael	Suyama
10748	Save-a-lot Markets	Janet	Leverling
10749	Island Trading	Margaret	Peacock
10750	Wartian Herkku	Anne	Dodsworth
10751	Richter Supermarkt	Janet	Leverling
10752	North/South	Andrew	Fuller
10753	Franchi S.p.A.	Janet	Leverling
10754	Magazzini Alimentari Riuniti	Michael	Suyama
10755	Bon app'	Margaret	Peacock
10756	Split Rail Beer & Ale	Laura	Callahan
10757	Save-a-lot Markets	Michael	Suyama
10758	Richter Supermarkt	Janet	Leverling
10759	Ana Trujillo Emparedados y helados	Janet	Leverling
10760	Maison Dewey	Margaret	Peacock
10761	Rattlesnake Canyon Grocery	Steven	Buchanan
10762	Folk och fä HB	Janet	Leverling
10763	Folies gourmandes	Janet	Leverling
10764	Ernst Handel	Michael	Suyama
10765	QUICK-Stop	Janet	Leverling
10766	Ottilies Käseladen	Margaret	Peacock
10767	Suprêmes délices	Margaret	Peacock
10768	Around the Horn	Janet	Leverling
10769	Vaffeljernet	Janet	Leverling
10770	Hanari Carnes	Laura	Callahan
10771	Ernst Handel	Anne	Dodsworth
10772	Lehmanns Marktstand	Janet	Leverling
10773	Ernst Handel	Nancy	Davolio
10774	Folk och fä HB	Margaret	Peacock
10775	The Cracker Box	Robert	King
10776	Ernst Handel	Nancy	Davolio
10777	Gourmet Lanchonetes	Robert	King
10778	Berglunds snabbköp	Janet	Leverling
10779	Morgenstern Gesundkost	Janet	Leverling
10780	LILA-Supermercado	Andrew	Fuller
10781	Wartian Herkku	Andrew	Fuller
10782	Cactus Comidas para llevar	Anne	Dodsworth
10783	Hanari Carnes	Margaret	Peacock
10784	Magazzini Alimentari Riuniti	Margaret	Peacock
10785	GROSELLA-Restaurante	Nancy	Davolio
10786	Queen Cozinha	Laura	Callahan
10787	La maison d'Asie	Andrew	Fuller
10788	QUICK-Stop	Nancy	Davolio
10789	Folies gourmandes	Nancy	Davolio
10790	Gourmet Lanchonetes	Michael	Suyama
10791	Frankenversand	Michael	Suyama
10792	Wolski  Zajazd	Nancy	Davolio
10793	Around the Horn	Janet	Leverling
10794	Que Delícia	Michael	Suyama
10795	Ernst Handel	Laura	Callahan
10796	HILARION-Abastos	Janet	Leverling
10797	Drachenblut Delikatessen	Robert	King
10798	Island Trading	Andrew	Fuller
10799	Königlich Essen	Anne	Dodsworth
10800	Seven Seas Imports	Nancy	Davolio
10801	Bólido Comidas preparadas	Margaret	Peacock
10802	Simons bistro	Margaret	Peacock
10803	Wellington Importadora	Margaret	Peacock
10804	Seven Seas Imports	Michael	Suyama
10805	The Big Cheese	Andrew	Fuller
10806	Victuailles en stock	Janet	Leverling
10807	Franchi S.p.A.	Margaret	Peacock
10808	Old World Delicatessen	Andrew	Fuller
10809	Wellington Importadora	Robert	King
10810	Laughing Bacchus Wine Cellars	Andrew	Fuller
10811	LINO-Delicateses	Laura	Callahan
10812	Reggiani Caseifici	Steven	Buchanan
10813	Ricardo Adocicados	Nancy	Davolio
10814	Victuailles en stock	Janet	Leverling
10815	Save-a-lot Markets	Andrew	Fuller
10816	Great Lakes Food Market	Margaret	Peacock
10817	Königlich Essen	Janet	Leverling
10818	Magazzini Alimentari Riuniti	Robert	King
10819	Cactus Comidas para llevar	Andrew	Fuller
10820	Rattlesnake Canyon Grocery	Janet	Leverling
10821	Split Rail Beer & Ale	Nancy	Davolio
10822	Trail's Head Gourmet Provisioners	Michael	Suyama
10823	LILA-Supermercado	Steven	Buchanan
10824	Folk och fä HB	Laura	Callahan
10825	Drachenblut Delikatessen	Nancy	Davolio
10826	Blondesddsl père et fils	Michael	Suyama
10827	Bon app'	Nancy	Davolio
10828	Rancho grande	Anne	Dodsworth
10829	Island Trading	Anne	Dodsworth
10830	Tradição Hipermercados	Margaret	Peacock
10831	Santé Gourmet	Janet	Leverling
10832	La maison d'Asie	Andrew	Fuller
10833	Ottilies Käseladen	Michael	Suyama
10834	Tradição Hipermercados	Nancy	Davolio
10835	Alfreds Futterkiste	Nancy	Davolio
10836	Ernst Handel	Robert	King
10837	Berglunds snabbköp	Anne	Dodsworth
10838	LINO-Delicateses	Janet	Leverling
10839	Tradição Hipermercados	Janet	Leverling
10840	LINO-Delicateses	Margaret	Peacock
10841	Suprêmes délices	Steven	Buchanan
10842	Tortuga Restaurante	Nancy	Davolio
10843	Victuailles en stock	Margaret	Peacock
10844	Piccolo und mehr	Laura	Callahan
10845	QUICK-Stop	Laura	Callahan
10846	Suprêmes délices	Andrew	Fuller
10847	Save-a-lot Markets	Margaret	Peacock
10848	Consolidated Holdings	Robert	King
10849	Königlich Essen	Anne	Dodsworth
10850	Victuailles en stock	Nancy	Davolio
10851	Ricardo Adocicados	Steven	Buchanan
10852	Rattlesnake Canyon Grocery	Laura	Callahan
10853	Blauer See Delikatessen	Anne	Dodsworth
10854	Ernst Handel	Janet	Leverling
10855	Old World Delicatessen	Janet	Leverling
10856	Antonio Moreno Taquería	Janet	Leverling
10857	Berglunds snabbköp	Laura	Callahan
10858	La corne d'abondance	Andrew	Fuller
10859	Frankenversand	Nancy	Davolio
10860	France restauration	Janet	Leverling
10861	White Clover Markets	Margaret	Peacock
10862	Lehmanns Marktstand	Laura	Callahan
10863	HILARION-Abastos	Margaret	Peacock
10864	Around the Horn	Margaret	Peacock
10865	QUICK-Stop	Andrew	Fuller
10866	Berglunds snabbköp	Steven	Buchanan
10867	Lonesome Pine Restaurant	Michael	Suyama
10868	Queen Cozinha	Robert	King
10869	Seven Seas Imports	Steven	Buchanan
10870	Wolski  Zajazd	Steven	Buchanan
10871	Bon app'	Anne	Dodsworth
10872	Godos Cocina Típica	Steven	Buchanan
10873	Wilman Kala	Margaret	Peacock
10874	Godos Cocina Típica	Steven	Buchanan
10875	Berglunds snabbköp	Margaret	Peacock
10876	Bon app'	Robert	King
10877	Ricardo Adocicados	Nancy	Davolio
10878	QUICK-Stop	Margaret	Peacock
10879	Wilman Kala	Janet	Leverling
10880	Folk och fä HB	Robert	King
10881	Cactus Comidas para llevar	Margaret	Peacock
10882	Save-a-lot Markets	Margaret	Peacock
10883	Lonesome Pine Restaurant	Laura	Callahan
10884	Let's Stop N Shop	Margaret	Peacock
10885	Suprêmes délices	Michael	Suyama
10886	Hanari Carnes	Nancy	Davolio
10887	Galería del gastrónomo	Laura	Callahan
10888	Godos Cocina Típica	Nancy	Davolio
10889	Rattlesnake Canyon Grocery	Anne	Dodsworth
10890	Du monde entier	Robert	King
10891	Lehmanns Marktstand	Robert	King
10892	Maison Dewey	Margaret	Peacock
10893	Königlich Essen	Anne	Dodsworth
10894	Save-a-lot Markets	Nancy	Davolio
10895	Ernst Handel	Janet	Leverling
10896	Maison Dewey	Robert	King
10897	Hungry Owl All-Night Grocers	Janet	Leverling
10898	Océano Atlántico Ltda.	Margaret	Peacock
10899	LILA-Supermercado	Steven	Buchanan
10900	Wellington Importadora	Nancy	Davolio
10901	HILARION-Abastos	Margaret	Peacock
10902	Folk och fä HB	Nancy	Davolio
10903	Hanari Carnes	Janet	Leverling
10904	White Clover Markets	Janet	Leverling
10905	Wellington Importadora	Anne	Dodsworth
10906	Wolski  Zajazd	Margaret	Peacock
10907	Spécialités du monde	Michael	Suyama
10908	Reggiani Caseifici	Margaret	Peacock
10909	Santé Gourmet	Nancy	Davolio
10910	Wilman Kala	Nancy	Davolio
10911	Godos Cocina Típica	Janet	Leverling
10912	Hungry Owl All-Night Grocers	Andrew	Fuller
10913	Queen Cozinha	Margaret	Peacock
10914	Queen Cozinha	Michael	Suyama
10915	Tortuga Restaurante	Andrew	Fuller
10916	Rancho grande	Nancy	Davolio
10917	Romero y tomillo	Margaret	Peacock
10918	Bottom-Dollar Markets	Janet	Leverling
10919	LINO-Delicateses	Andrew	Fuller
10920	Around the Horn	Margaret	Peacock
10921	Vaffeljernet	Nancy	Davolio
10922	Hanari Carnes	Steven	Buchanan
10923	La maison d'Asie	Robert	King
10924	Berglunds snabbköp	Janet	Leverling
10925	Hanari Carnes	Janet	Leverling
10926	Ana Trujillo Emparedados y helados	Margaret	Peacock
10927	La corne d'abondance	Margaret	Peacock
10928	Galería del gastrónomo	Nancy	Davolio
10929	Frankenversand	Michael	Suyama
10930	Suprêmes délices	Margaret	Peacock
10931	Richter Supermarkt	Margaret	Peacock
10932	Bon app'	Laura	Callahan
10933	Island Trading	Michael	Suyama
10934	Lehmanns Marktstand	Janet	Leverling
10935	Wellington Importadora	Margaret	Peacock
10936	Great Lakes Food Market	Janet	Leverling
10937	Cactus Comidas para llevar	Robert	King
10938	QUICK-Stop	Janet	Leverling
10939	Magazzini Alimentari Riuniti	Andrew	Fuller
10940	Bon app'	Laura	Callahan
10941	Save-a-lot Markets	Robert	King
10942	Reggiani Caseifici	Anne	Dodsworth
10943	B's Beverages	Margaret	Peacock
10944	Bottom-Dollar Markets	Michael	Suyama
10945	Morgenstern Gesundkost	Margaret	Peacock
10946	Vaffeljernet	Nancy	Davolio
10947	B's Beverages	Janet	Leverling
10948	Godos Cocina Típica	Janet	Leverling
10949	Bottom-Dollar Markets	Andrew	Fuller
10950	Magazzini Alimentari Riuniti	Nancy	Davolio
10951	Richter Supermarkt	Anne	Dodsworth
10952	Alfreds Futterkiste	Nancy	Davolio
10953	Around the Horn	Anne	Dodsworth
10954	LINO-Delicateses	Steven	Buchanan
10955	Folk och fä HB	Laura	Callahan
10956	Blauer See Delikatessen	Michael	Suyama
10957	HILARION-Abastos	Laura	Callahan
10958	Océano Atlántico Ltda.	Robert	King
10959	Gourmet Lanchonetes	Michael	Suyama
10960	HILARION-Abastos	Janet	Leverling
10961	Queen Cozinha	Laura	Callahan
10962	QUICK-Stop	Laura	Callahan
10963	Furia Bacalhau e Frutos do Mar	Anne	Dodsworth
10964	Spécialités du monde	Janet	Leverling
10965	Old World Delicatessen	Michael	Suyama
10966	Chop-suey Chinese	Margaret	Peacock
10967	Toms Spezialitäten	Andrew	Fuller
10968	Ernst Handel	Nancy	Davolio
10969	Comércio Mineiro	Nancy	Davolio
10970	Bólido Comidas preparadas	Anne	Dodsworth
10971	France restauration	Andrew	Fuller
10972	La corne d'abondance	Margaret	Peacock
10973	La corne d'abondance	Michael	Suyama
10974	Split Rail Beer & Ale	Janet	Leverling
10975	Bottom-Dollar Markets	Nancy	Davolio
10976	HILARION-Abastos	Nancy	Davolio
10977	Folk och fä HB	Laura	Callahan
10978	Maison Dewey	Anne	Dodsworth
10979	Ernst Handel	Laura	Callahan
10980	Folk och fä HB	Margaret	Peacock
10981	Hanari Carnes	Nancy	Davolio
10982	Bottom-Dollar Markets	Andrew	Fuller
10983	Save-a-lot Markets	Andrew	Fuller
10984	Save-a-lot Markets	Nancy	Davolio
10985	Hungry Owl All-Night Grocers	Andrew	Fuller
10986	Océano Atlántico Ltda.	Laura	Callahan
10987	Eastern Connection	Laura	Callahan
10988	Rattlesnake Canyon Grocery	Janet	Leverling
10989	Que Delícia	Andrew	Fuller
10990	Ernst Handel	Andrew	Fuller
10991	QUICK-Stop	Nancy	Davolio
10992	The Big Cheese	Nancy	Davolio
10993	Folk och fä HB	Robert	King
10994	Vaffeljernet	Andrew	Fuller
10995	Pericles Comidas clásicas	Nancy	Davolio
10996	QUICK-Stop	Margaret	Peacock
10997	LILA-Supermercado	Laura	Callahan
10998	Wolski  Zajazd	Laura	Callahan
10999	Ottilies Käseladen	Michael	Suyama
11000	Rattlesnake Canyon Grocery	Andrew	Fuller
11001	Folk och fä HB	Andrew	Fuller
11002	Save-a-lot Markets	Margaret	Peacock
11003	The Cracker Box	Janet	Leverling
11004	Maison Dewey	Janet	Leverling
11005	Wilman Kala	Andrew	Fuller
11006	Great Lakes Food Market	Janet	Leverling
11007	Princesa Isabel Vinhos	Laura	Callahan
11008	Ernst Handel	Robert	King
11009	Godos Cocina Típica	Andrew	Fuller
11010	Reggiani Caseifici	Andrew	Fuller
11011	Alfreds Futterkiste	Janet	Leverling
11012	Frankenversand	Nancy	Davolio
11013	Romero y tomillo	Andrew	Fuller
11014	LINO-Delicateses	Andrew	Fuller
11015	Santé Gourmet	Andrew	Fuller
11016	Around the Horn	Anne	Dodsworth
11017	Ernst Handel	Anne	Dodsworth
11018	Lonesome Pine Restaurant	Margaret	Peacock
11019	Rancho grande	Michael	Suyama
11020	Ottilies Käseladen	Andrew	Fuller
11021	QUICK-Stop	Janet	Leverling
11022	Hanari Carnes	Anne	Dodsworth
11023	B's Beverages	Nancy	Davolio
11024	Eastern Connection	Margaret	Peacock
11025	Wartian Herkku	Michael	Suyama
11026	Franchi S.p.A.	Margaret	Peacock
11027	Bottom-Dollar Markets	Nancy	Davolio
11028	Königlich Essen	Andrew	Fuller
11029	Chop-suey Chinese	Margaret	Peacock
11030	Save-a-lot Markets	Robert	King
11031	Save-a-lot Markets	Michael	Suyama
11032	White Clover Markets	Andrew	Fuller
11033	Richter Supermarkt	Robert	King
11034	Old World Delicatessen	Laura	Callahan
11035	Suprêmes délices	Andrew	Fuller
11036	Drachenblut Delikatessen	Laura	Callahan
11037	Godos Cocina Típica	Robert	King
11038	Suprêmes délices	Nancy	Davolio
11039	LINO-Delicateses	Nancy	Davolio
11040	Great Lakes Food Market	Margaret	Peacock
11041	Chop-suey Chinese	Janet	Leverling
11042	Comércio Mineiro	Andrew	Fuller
11043	Spécialités du monde	Steven	Buchanan
11044	Wolski  Zajazd	Margaret	Peacock
11045	Bottom-Dollar Markets	Michael	Suyama
11046	Die Wandernde Kuh	Laura	Callahan
11047	Eastern Connection	Robert	King
11048	Bottom-Dollar Markets	Robert	King
11049	Gourmet Lanchonetes	Janet	Leverling
11050	Folk och fä HB	Laura	Callahan
11051	La maison d'Asie	Robert	King
11052	Hanari Carnes	Janet	Leverling
11053	Piccolo und mehr	Andrew	Fuller
11054	Cactus Comidas para llevar	Laura	Callahan
11055	HILARION-Abastos	Robert	King
11056	Eastern Connection	Laura	Callahan
11057	North/South	Janet	Leverling
11058	Blauer See Delikatessen	Anne	Dodsworth
11059	Ricardo Adocicados	Andrew	Fuller
11060	Franchi S.p.A.	Andrew	Fuller
11061	Great Lakes Food Market	Margaret	Peacock
11062	Reggiani Caseifici	Margaret	Peacock
11063	Hungry Owl All-Night Grocers	Janet	Leverling
11064	Save-a-lot Markets	Nancy	Davolio
11065	LILA-Supermercado	Laura	Callahan
11066	White Clover Markets	Robert	King
11067	Drachenblut Delikatessen	Nancy	Davolio
11068	Queen Cozinha	Laura	Callahan
11069	Tortuga Restaurante	Nancy	Davolio
11070	Lehmanns Marktstand	Andrew	Fuller
11071	LILA-Supermercado	Nancy	Davolio
11072	Ernst Handel	Margaret	Peacock
11073	Pericles Comidas clásicas	Andrew	Fuller
11074	Simons bistro	Robert	King
11075	Richter Supermarkt	Laura	Callahan
11076	Bon app'	Margaret	Peacock
11077	Rattlesnake Canyon Grocery	Nancy	Davolio


### 2. Products from a Specific Supplier
* **Objective:** To filter products based on a specific supplier.
* **Technique:** An `INNER JOIN` connects the `Products` and `Suppliers` tables, with a `WHERE` clause to filter by company name.

```sql
SELECT
    p.ProductID,
    s.CompanyName,
    p.ProductName
FROM
    Products p
INNER JOIN
    Suppliers s ON p.SupplierID = s.SupplierID
WHERE
    s.CompanyName = 'Exotic Liquids';
```
* **Result :**
ProductId	CompanyName	ProductName
1	Exotic Liquids	Chai
2	Exotic Liquids	Chang
3	Exotic Liquids	Aniseed Syrup


### 3. Late Shipments
* **Objective:** To identify operational inefficiencies in the shipping process.
* **Technique:** A simple date comparison in the `WHERE` clause is used to find all orders shipped after their required date.

```sql
SELECT
    OrderID,
    RequiredDate,
    ShippedDate
FROM
    Orders
WHERE
    ShippedDate > RequiredDate;
```
* **Result:**
OrderId	RequiredDate	ShippedDate
10264	2016-08-21	2016-08-23
10271	2016-08-29	2016-08-30
10280	2016-09-11	2016-09-12
10302	2016-10-08	2016-10-09
10309	2016-10-17	2016-10-23
10320	2016-10-17	2016-10-18
10380	2017-01-09	2017-01-16
10423	2017-02-06	2017-02-24
10427	2017-02-24	2017-03-03
10433	2017-03-03	2017-03-04
10451	2017-03-05	2017-03-12
10483	2017-04-21	2017-04-25
10515	2017-05-07	2017-05-23
10523	2017-05-29	2017-05-30
10545	2017-06-19	2017-06-26
10578	2017-07-22	2017-07-25
10593	2017-08-06	2017-08-13
10596	2017-08-08	2017-08-12
10660	2017-10-06	2017-10-15
10663	2017-09-24	2017-10-03
10687	2017-10-28	2017-10-30
10705	2017-11-12	2017-11-18
10709	2017-11-14	2017-11-20
10726	2017-11-17	2017-12-05
10727	2017-12-01	2017-12-05
10749	2017-12-18	2017-12-19
10777	2017-12-29	2018-01-21
10779	2018-01-13	2018-01-14
10807	2018-01-28	2018-01-30
10816	2018-02-03	2018-02-04
10827	2018-01-26	2018-02-06
10828	2018-01-27	2018-02-04
10847	2018-02-05	2018-02-10
10924	2018-04-01	2018-04-08
10927	2018-04-02	2018-04-08
10960	2018-04-02	2018-04-08
10970	2018-04-07	2018-04-24


### 4. Total Cost per Order
* **Objective:** To calculate the revenue generated by each order, including any discounts.
* **Technique:** This query joins multiple tables and performs a `SUM` on a calculated column (`UnitPrice * Quantity * (1 - Discount)`).

```sql
SELECT
    o.OrderID,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalOrderCost
FROM
    Orders o
INNER JOIN
    OrderDetails od ON o.OrderID = od.OrderID
GROUP BY
    o.OrderID
ORDER BY
    TotalOrderCost DESC;
```
* **Result :**
OrderId	TotalOrderCost
10865	16387.5
10981	15810.0
11030	12615.05
10889	11380.0
10417	11188.4
10817	10952.845
10897	10835.24
10479	10495.6
10540	10191.7
10691	10164.8
10515	9921.3
10372	9210.9
10424	9194.56
11032	8902.5
10514	8623.45
10353	8593.28
10816	8446.45
10360	7390.2
11017	6750.0
10776	6635.275
10607	6475.4
10895	6379.4
10612	6375.0
11021	6306.24
10912	6200.55
10633	5510.5925
10893	5502.11
10351	5398.725
10324	5275.715
10678	5256.5
11072	5218.0
10634	4985.5
10687	4960.9
10847	4931.92
10440	4924.135
10430	4899.2
10993	4895.4375
10694	4825.0
10979	4813.5
10616	4807.0
10595	4725.0
10510	4707.54
10836	4705.5
11008	4680.9
10666	4666.94
10841	4581.0
10329	4578.43
10745	4529.8
10658	4464.6
10711	4451.7
10953	4441.25
10949	4422.0
10657	4371.6
10762	4337.0
11064	4330.4
10990	4288.85
10530	4180.0
10518	4150.05
10605	4109.7
10941	4011.75
10458	3891.0
10401	3868.6
10451	3849.66
10672	3815.25
10845	3812.7
10305	3741.3
11056	3740.0
10789	3687.0
10772	3603.22
10252	3597.9
10962	3584.0
10988	3574.8
10549	3554.275
10267	3536.6
10861	3523.4
10359	3471.68
10718	3463.0
10698	3436.4435
10709	3424.0
10339	3354.0
11033	3232.8
10524	3192.65
10490	3163.2
10688	3160.6
10886	3127.5
10588	3120.0
10742	3118.0
11039	3090.0
10757	3082.0
10400	3063.0
11053	3055.0
10801	3026.85
10286	3016.0
10852	2984.0
10854	2966.5
10555	2944.4
10802	2942.8125
10345	2924.8
10760	2917.0
10382	2900.0
10701	2864.5
10561	2844.5
10316	2835.0
10713	2827.9
10823	2826.0
11012	2825.3
10546	2812.0
10629	2775.05
10805	2775.0
10987	2772.0
11001	2769.0
10637	2761.9375
10894	2753.1
10938	2731.875
10638	2720.05
10402	2713.5
10302	2708.8
10618	2697.5
10831	2684.4
10455	2684.0
10298	2645.0
11007	2633.9
10787	2622.76
10851	2603.0
10393	2556.95
10511	2550.0
10703	2545.0
10567	2519.0
10465	2518.0
10398	2505.6
10255	2490.5
10337	2467.0
10570	2465.25
10523	2444.31
10340	2436.18
11031	2393.5
10369	2390.4
10598	2388.5
10516	2381.05
10948	2362.25
10796	2341.364
10522	2318.24
10519	2314.2
10746	2311.7
10766	2310.0
10670	2301.75
10344	2296.0
10991	2296.0
10764	2286.0
10601	2285.0
10804	2278.4
10930	2255.5
10583	2237.5
10977	2233.0
10855	2227.8875
10384	2222.4
10533	2222.2
10986	2220.0
10714	2205.75
10748	2196.0
10290	2169.0
11028	2160.0
10795	2158.0
10575	2147.4
10558	2142.9
10413	2123.2
10395	2122.92
10419	2097.6
10314	2094.3
10390	2090.88
10892	2090.0
10573	2082.0
10693	2071.2
10872	2058.46
10641	2054.0
10964	2052.5
10503	2048.5
10857	2048.2125
10361	2046.24
10273	2037.28
10335	2036.16
10773	2030.4
11068	2027.08
10985	2023.38
10452	2018.5
10436	1994.52
10593	1994.4
10756	1990.0
10871	1979.23
10830	1974.0
11024	1966.81
10877	1955.125
10755	1948.5
10541	1946.52
10513	1942.0
10535	1940.85
10838	1938.375
10921	1936.0
10663	1930.4
10904	1924.25
10868	1920.6
10747	1912.85
10396	1903.8
10706	1893.0
10431	1892.25
10731	1890.5
10294	1887.6
10997	1885.0
10263	1873.8
10249	1863.4
10729	1850.0
10342	1840.64
10449	1838.2
11059	1838.0
10924	1835.7
10389	1832.8
10406	1830.78
10791	1829.757
10537	1823.8
10470	1820.8
10418	1814.8
11002	1811.1
10327	1810.0
10984	1809.75
10547	1792.8
10442	1792.0
10932	1788.63
10814	1788.45
10332	1786.88
10650	1779.2
11041	1773.0
10684	1768.0
10399	1765.6
10829	1764.0
10957	1762.7
10309	1762.0
10566	1761.0
10441	1755.0
11035	1754.5
10285	1743.36
10971	1733.06
10554	1728.525
11055	1727.5
10420	1707.84
10660	1701.0
10812	1692.8
11036	1692.0
10368	1689.78
10769	1684.275
10551	1677.3
10954	1659.535
10459	1659.2
10330	1649.0
10536	1645.0
10758	1644.6
10707	1641.0
10700	1638.4
10751	1631.484
10869	1630.0
11070	1629.975
10727	1624.5
10408	1622.4
10346	1618.88
10258	1614.88
10312	1614.8
10464	1609.28
10404	1591.25
10750	1590.5625
10343	1584.0
10457	1584.0
10485	1584.0
11018	1575.0
10722	1570.0
10799	1553.5
10250	1552.6
10362	1549.6
10553	1546.3
10878	1539.0
10461	1538.7
10667	1536.8
10645	1535.0
10786	1531.08
10765	1515.6
10488	1512.0
10475	1505.18
10260	1504.65
10543	1504.5
10626	1503.6
10527	1503.0
10572	1501.085
10880	1500.0
11023	1500.0
10734	1498.35
10325	1497.0
10278	1488.8
10784	1488.0
11046	1485.8
10603	1483.0
10768	1477.0
10481	1472.0
10800	1468.935
10733	1459.0
10272	1456.0
10918	1447.5
10646	1446.0
10253	1444.8
10783	1442.5
10429	1441.375
10392	1440.0
10649	1434.0
10834	1432.714
10675	1423.0
10297	1420.0
10740	1416.0
10283	1414.8
10499	1412.0
10808	1411.0
10968	1408.0
10946	1407.5
10686	1404.45
10617	1402.5
11022	1402.0
10624	1393.24
10504	1388.5
10497	1380.6
10884	1378.07
10270	1376.0
10644	1371.8
10373	1366.4
10989	1353.6
11063	1342.95
10623	1336.95
10779	1335.0
11052	1332.0
10471	1328.0
10635	1326.225
10380	1313.82
11045	1309.5
10978	1303.195
10728	1296.75
10292	1296.0
10715	1296.0
10665	1295.0
10664	1288.3875
10681	1287.4
11029	1286.8
10486	1272.0
10717	1270.75
10680	1261.875
10619	1260.0
11077	1255.7205
10474	1249.1
10564	1234.05
10712	1233.48
10388	1228.8
10659	1227.02
10885	1209.0
10277	1200.8
10999	1197.95
10995	1196.0
10421	1194.27
10407	1194.0
10803	1193.01
10319	1191.2
10627	1185.75
10596	1180.88
10265	1176.0
10929	1174.75
10284	1170.375
10328	1168.0
10357	1167.68
10557	1152.5
10526	1151.4
10820	1140.0
10606	1130.4
10919	1122.8
10257	1119.9
10961	1119.9
10303	1117.8
10370	1117.6
10846	1112.0
10356	1106.4
10268	1101.2
10590	1101.0
10966	1098.46
10866	1096.2
10653	1083.15
10749	1080.0
10859	1078.6875
10439	1078.0
10560	1072.425
10837	1064.5
10608	1064.0
10387	1058.4
10296	1050.6
10472	1036.8
10444	1031.7
10825	1030.76
11026	1030.0
10944	1025.325
10423	1020.0
10982	1014.0
10580	1013.745
10736	997.0
10696	996.0
10326	982.0
10781	975.88
10842	975.0
10849	967.819
10411	966.8
10563	965.0
10469	956.675
10304	954.4
10364	950.0
10529	946.0
10994	940.5
10338	934.5
10901	934.5
11011	933.5
10903	932.05
10828	932.0
10848	931.5
11066	928.75
10721	923.875
10933	920.6
10671	920.1
10876	917.0
10447	914.4
10494	912.0
10976	912.0
10967	910.4
10833	906.93
11000	903.75
10630	903.6
10383	899.0
10882	892.64
10569	890.0
10487	889.7
10552	880.5
10692	878.0
11027	877.725
10333	877.2
10774	868.75
10377	863.6
10902	863.43
10379	863.28
10690	862.5
10890	860.1
10911	858.0
11058	858.0
10403	855.015
10811	852.0
10433	851.2
10492	851.2
10293	848.7
10965	848.0
10835	845.8
10719	844.2525
10827	843.0
10576	838.45
10556	835.2
10367	834.2
10818	833.0
10839	827.55
10287	819.0
10525	818.4
11047	817.875
10502	816.3
10643	814.5
10347	814.42
10677	813.365
10591	812.5
11050	810.0
10611	808.0
10587	807.38
10697	805.425
10410	802.0
10685	801.1
10927	800.0
10931	799.2
10532	796.35
11076	792.75
10958	781.0
10913	768.75
10574	764.3
10621	758.5
10480	756.0
10301	755.0
10896	750.5
10507	749.0625
10923	748.8
10922	742.5
10744	736.0
10844	735.0
11038	732.6
10788	731.5
10826	730.0
10790	722.5
10983	720.9
10416	720.0
10780	720.0
10597	718.08
10468	717.6
10975	717.5
10397	716.72
10463	713.3
10943	711.0
10875	709.55
10640	708.75
10716	706.0
10642	696.0
10264	695.625
10385	691.2
10916	686.7
10998	686.0
10550	683.3
10821	678.0
10956	677.0
10909	670.0
10483	668.8
10908	663.1
10679	660.0
10856	660.0
10726	655.0
10251	654.06
10427	651.0
10858	649.0
11010	645.0
10937	644.8
10269	642.2
10350	642.06
10695	642.0
10565	639.9
10724	638.5
10939	637.5
10647	636.0
11020	632.4
10435	631.6
10636	629.5
10850	629.0
10668	625.275
10853	625.0
11015	622.35
10935	619.5
11009	616.5
10763	616.0
10280	613.2
10879	611.3
10493	608.4
10300	608.0
10888	605.0
10656	604.215
10813	602.4
10654	601.83
10704	595.5
10584	593.75
11044	591.6
10632	589.0
11005	586.0
10262	584.0
10862	581.0
10498	575.0
10669	570.0
10577	569.0
10354	568.8
10594	565.5
10661	562.6
10622	560.0
10942	560.0
10996	560.0
10477	558.0
10456	557.6
10254	556.62
10571	550.5875
10720	550.0
10915	539.5
11034	539.4
10274	538.6
10914	537.5
10735	536.4
10676	534.85
10512	525.3
11048	525.0
10500	523.26
10559	520.41
10860	519.0
10256	517.8
10443	517.44
10315	516.8
10592	516.4675
10320	516.0
10926	514.4
11061	510.0
10761	507.0
10639	500.0
10934	500.0
10306	498.5
11075	498.1
10291	497.52
10599	493.0
11016	491.5
10562	488.7
10432	485.0
11071	484.5
10730	484.2625
10355	480.0
10600	479.8
10625	479.75
10289	479.4
10578	477.0
10819	477.0
10925	475.15
10832	475.11
10689	472.5
10478	471.2
10952	471.2
10542	469.11
10723	468.45
10534	465.7
10614	464.0
10374	459.0
10951	458.755
10936	456.0
10438	454.0
10910	452.9
10628	450.0
10261	448.0
10363	447.2
10798	446.6
10448	443.4
10394	442.0
10863	441.15
10248	440.0
10806	439.6
10489	439.2
10974	439.0
10358	429.4
10906	427.5
10450	425.12
10307	424.0
10609	424.0
10276	420.0
10797	420.0
10544	417.2
10506	415.8
10673	412.35
10453	407.7
11062	406.4
11042	405.75
10365	403.2
10405	400.0
10792	399.85
10376	399.0
10651	397.8
10437	393.0
10528	392.2
10920	390.0
10785	387.5
10484	386.2
10705	378.0
10682	375.5
10648	372.375
10891	368.9325
10917	365.89
10348	363.6
11013	361.0
10425	360.0
10732	360.0
10940	360.0
11069	360.0
10539	355.5
10613	353.2
10341	352.6
10517	352.0
10279	351.0
10299	349.5
10266	346.56
10771	344.0
10905	342.0
10426	338.2
10375	338.0
10873	336.8
10310	336.0
10412	334.8
10454	331.2
10582	330.0
10702	330.0
11006	329.685
11003	326.0
10434	321.12
10759	320.0
10409	319.2
10743	319.2
10652	318.835
10579	317.75
10794	314.76
10581	310.0
10874	310.0
11054	305.0
11073	300.0
10610	299.25
11004	295.38
10275	291.84
10973	291.55
10317	288.0
10725	287.8
10336	285.12
10864	282.0
10495	278.0
11049	273.6
11025	270.0
10311	268.8
11060	266.0
10960	265.35
10491	259.505
10752	252.0
10972	251.5
10824	250.8
10980	248.0
10446	246.24
10945	245.0
11014	243.18
10318	240.4
10548	240.1
10508	240.0
10739	240.0
10822	237.9
10770	236.25
10467	235.2
11074	232.085
10604	230.85
10473	230.4
10741	228.0
10775	228.0
10521	225.5
10414	224.83
10777	224.0
10970	224.0
10947	220.0
10466	216.0
10840	211.2
10545	210.0
11043	210.0
10520	200.0
11040	200.0
10428	192.0
10793	191.1
10496	190.0
11065	189.42
10810	187.0
10313	182.4
10476	180.48
10708	180.4
10460	176.1
10445	174.9
10386	166.0
10323	164.4
10870	160.0
10843	159.0
10462	156.0
10282	155.4
10568	155.0
10655	154.4
10881	150.0
10501	149.0
10505	147.9
10482	147.0
10334	144.8
10321	144.0
10585	142.5
10349	141.6
10809	140.0
10538	139.8
10737	139.8
10928	137.5
10509	136.8
10352	136.3
10366	136.0
10959	131.75
10662	125.0
10899	122.4
10295	121.6
10615	120.0
10699	114.0
10322	112.0
10381	112.0
10531	110.0
10950	110.0
10907	108.5
10969	108.0
10378	103.2
10415	102.4
10259	100.8
10867	98.4
10778	96.5
10710	93.5
10308	88.8
10331	88.5
10753	88.0
11067	86.85
10281	86.5
10391	86.4
10288	80.1
11019	76.0
10955	74.4
10371	72.96
10589	72.0
10887	70.0
10992	69.6
10683	63.0
11037	60.0
10963	57.8
10620	57.5
10631	55.8
10754	55.2
10738	52.35
10422	49.8
10602	48.75
10271	48.0
10674	45.0
11057	45.0
10815	40.0
10883	36.0
11051	36.0
10900	33.75
10898	30.0
10767	28.0
10586	23.8
10807	18.4
10782	12.5

### 5. Customers with No Orders
* **Objective:** To identify potential leads or inactive customers.
* **Technique:** This query uses a `LEFT JOIN` to find all customers who do not have a corresponding entry in the `Orders` table.

```sql
SELECT
    c.CustomerID,
    c.CompanyName
FROM
    Customers c
LEFT JOIN
    Orders o ON c.CustomerID = o.CustomerID
WHERE
    o.OrderID IS NULL;
```
* **Result :**
CustomerId	CompanyName
FISSA	FISSA Fabrica Inter. Salchichas S.A.
PARIS	Paris spécialités
Val2 	IT
VALON	IT


### 6. Top-Performing Employees by Order Volume
* **Objective:** To identify top-performing employees based on the volume of orders processed (in this case, those with over 100 orders).
* **Technique:** This query uses `COUNT` to aggregate the number of orders and the `HAVING` clause to filter the results *after* grouping.

```sql
SELECT
    e.FirstName,
    e.LastName,
    COUNT(o.OrderID) AS NumberOfOrders
FROM
    Employees e
INNER JOIN
    Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY
    e.EmployeeID, e.FirstName, e.LastName
HAVING
    COUNT(o.OrderID) > 100
ORDER BY
    NumberOfOrders DESC;
```
* **Result :**
FirstName	LastName	NumberOfOrders
Margaret	Peacock	156
Janet	Leverling	127
Nancy	Davolio	123
Laura	Callahan	104

### 7. Overall Order Date Range
* **Objective:** An exploratory query to understand the time span of the dataset.
* **Technique:** `MIN()` and `MAX()` aggregate functions are used on the `OrderDate` column.

```sql
SELECT
    MIN(OrderDate) AS FirstOrder,
    MAX(OrderDate) AS LastOrder
FROM
    Orders;
```
* **Result:**
| FirstOrder | LastOrder |
|:---|:---|
| 2016-07-04 | 2018-05-06 |


### 8. Quarterly Order Summary
* **Objective:** To analyze business activity and identify trends over time.
* **Technique:** This query uses a `CASE` statement to create custom groupings for each fiscal quarter and year.

```sql
SELECT
    CASE
        WHEN strftime('%m', OrderDate) IN ('01', '02', '03') THEN strftime('%Y', OrderDate) || '-Q1'
        WHEN strftime('%m', OrderDate) IN ('04', '05', '06') THEN strftime('%Y', OrderDate) || '-Q2'
        WHEN strftime('%m', OrderDate) IN ('07', '08', '09') THEN strftime('%Y', OrderDate) || '-Q3'
        WHEN strftime('%m', OrderDate) IN ('10', '11', '12') THEN strftime('%Y', OrderDate) || '-Q4'
    END AS OrderQuarter,
    COUNT(OrderID) AS NumberOfOrders
FROM
    Orders
GROUP BY
    OrderQuarter
ORDER BY
    OrderQuarter;
```
* **Result :**
OrderQuarter	NumberOfOrders
2016-Q3	70
2016-Q4	82
2017-Q1	92
2017-Q2	93
2017-Q3	103
2017-Q4	120
2018-Q1	182
2018-Q2	88

´´´

