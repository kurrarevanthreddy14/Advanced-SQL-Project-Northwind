# Advanced-SQL-Project-Northwind
## Project Objective
This project demonstrates proficiency in advanced SQL by querying the classic Northwind relational database. The goal was to extract actionable business insights by answering a wide range of business questions related to customers, employees, orders, and products. The queries showcase a range of SQL techniques including multi-table JOINs, LEFT JOINs, aggregate functions with GROUP BY and HAVING, and conditional logic with CASE statements.

## Dataset
This analysis uses the standard **Northwind** sample database, which models the sales data for a fictional specialty foods import/export company called "Northwind Traders." The database includes interconnected tables for `Customers`, `Orders`, `Employees`, `Products`, `Suppliers`, and more.

## Tools Used
* **Database:** SQLite
* **Querying Tool:** DB Browser for SQLite

---

## SQL Analysis: Business Questions & Queries

This project answers eight key business questions, moving from basic joins to more complex aggregations and conditional logic.

### 1. Who was the customer and employee for each order?
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
* **Result:**
```OrderId	CompanyName	FirstName	LastName
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
´´´

### 2. Which products are supplied by 'Exotic Liquids'?
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
* **Result:**

```ProductId	CompanyName	ProductName
1	Exotic Liquids	Chai
2	Exotic Liquids	Chang
3	Exotic Liquids	Aniseed Syrup
´´´


### 3. Which orders were shipped late?
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

### 4. What is the total cost of each order?
* **Objective:** To calculate the revenue generated by each order, including any discounts.
* **Technique:** This query joins multiple tables and performs a `SUM` on a calculated column (`UnitPrice * Quantity * (1 - Discount)`), grouping the results by each `OrderID`.

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

### 5. Which customers have never placed an order?
* **Objective:** To identify potential leads or inactive customers.
* **Technique:** This query uses a `LEFT JOIN` to find all customers who do not have a corresponding entry in the `Orders` table. A `NULL` `OrderID` signifies a customer with no orders.

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

### 6. Which employees are top performers (handled > 100 orders)?
* **Objective:** To identify top-performing employees based on order volume.
* **Technique:** This query uses `COUNT` to aggregate the number of orders and the `HAVING` clause to filter these results *after* grouping.

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

### 7. What is the date range of the data?
* **Objective:** An exploratory query to understand the time span of the dataset.
* **Technique:** `MIN()` and `MAX()` aggregate functions are used on the `OrderDate` column.

```sql
SELECT
    MIN(OrderDate) AS FirstOrder,
    MAX(OrderDate) AS LastOrder
FROM
    Orders;
```

### 8. How many orders were placed per quarter?
* **Objective:** To analyze business activity and identify trends over time.
* **Technique:** This query uses a `CASE` statement to create custom groupings for each fiscal quarter and year, then uses `COUNT` and `GROUP BY` to provide a summary.

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

