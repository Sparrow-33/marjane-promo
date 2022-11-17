<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<jsp:include page="../components/head.jsp"></jsp:include>
<style>
    /*Overrides for Tailwind CSS */

    /*Form fields*/
    .dataTables_wrapper select,
    .dataTables_wrapper .dataTables_filter input {
        color: #4a5568;
        /*text-gray-700*/
        padding-left: 1rem;
        /*pl-4*/
        padding-right: 1rem;
        /*pl-4*/
        padding-top: .5rem;
        /*pl-2*/
        padding-bottom: .5rem;
        /*pl-2*/
        line-height: 1.25;
        /*leading-tight*/
        border-width: 2px;
        /*border-2*/
        border-radius: .25rem;
        border-color: #edf2f7;
        /*border-gray-200*/
        background-color: #edf2f7;
        /*bg-gray-200*/
    }

    /*Row Hover*/
    table.dataTable.hover tbody tr:hover,
    table.dataTable.display tbody tr:hover {
        background-color: #ebf4ff;
        /*bg-indigo-100*/
    }

    /*Pagination Buttons*/
    .dataTables_wrapper .dataTables_paginate .paginate_button {
        font-weight: 700;
        /*font-bold*/
        border-radius: .25rem;
        /*rounded*/
        border: 1px solid transparent;
        /*border border-transparent*/
    }

    /*Pagination Buttons - Current selected */
    .dataTables_wrapper .dataTables_paginate .paginate_button.current {
        color: #fff !important;
        /*text-white*/
        box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0 rgba(0, 0, 0, .06);
        /*shadow*/
        font-weight: 700;
        /*font-bold*/
        border-radius: .25rem;
        /*rounded*/
        background: #667eea !important;
        /*bg-indigo-500*/
        border: 1px solid transparent;
        /*border border-transparent*/
    }

    /*Pagination Buttons - Hover */
    .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
        color: #fff !important;
        /*text-white*/
        box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0 rgba(0, 0, 0, .06);
        /*shadow*/
        font-weight: 700;
        /*font-bold*/
        border-radius: .25rem;
        /*rounded*/
        background: #667eea !important;
        /*bg-indigo-500*/
        border: 1px solid transparent;
        /*border border-transparent*/
    }

    /*Add padding to bottom border */
    table.dataTable.no-footer {
        border-bottom: 1px solid #e2e8f0;
        /*border-b-1 border-gray-300*/
        margin-top: 0.75em;
        margin-bottom: 0.75em;
    }

    /*Change colour of responsive icon*/
    table.dataTable.dtr-inline.collapsed>tbody>tr>td:first-child:before,
    table.dataTable.dtr-inline.collapsed>tbody>tr>th:first-child:before {
        background-color: #667eea !important;
        /*bg-indigo-500*/
    }
</style>
<body>
<main  x-data=" {
       modelOpen: false,
       index : true,
       alert : true,
       action: false
                }"
       class="bg-gray-50 dark:bg-gray-800 rounded-2xl h-screen  relative ">

    <%-- alert start--%>
    <c:if test="${status == true }">
        <div x-show="alert"
             x-transition:enter="transition ease-in duration-200"
             x-transition:enter-start="opacity-0 transform -translate-x-40"
             x-transition:enter-end="opacity-100 transform translate-x-0"
             x-transition:leave="transition ease-in duration-200"
             x-transition:leave-start="opacity-100 transform translate-x-0"
             x-transition:leave-end="opacity-0 transform -translate-x-40"
             x-init="setTimeout(() => alert = false, 5000)"
             class=" absolute z-50 mt-10 right-20 flex w-full max-w-sm overflow-hidden bg-white rounded-lg shadow-md dark:bg-gray-800">
            <div class="flex items-center justify-center w-12 bg-[#10b981]" style="background: #10b981">
                <svg class="w-6 h-6 text-white fill-current" viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg">
                    <path d="M20 3.33331C10.8 3.33331 3.33337 10.8 3.33337 20C3.33337 29.2 10.8 36.6666 20 36.6666C29.2 36.6666 36.6667 29.2 36.6667 20C36.6667 10.8 29.2 3.33331 20 3.33331ZM16.6667 28.3333L8.33337 20L10.6834 17.65L16.6667 23.6166L29.3167 10.9666L31.6667 13.3333L16.6667 28.3333Z" />
                </svg>
            </div>

            <div class="px-4 py-2 -mx-3">
                <div class="mx-3">
                    <span class="font-semibold text-emerald-500 dark:text-emerald-400">Success</span>
                    <p class="text-sm text-gray-600 dark:text-gray-200">${message}</p>
                </div>
            </div>
        </div>
    </c:if>
    <%-- alert end--%>
    <div :class="{'absolute h-full w-full bg-white backdrop-filter backdrop-blur-lg bg-opacity-20 z-30': modelOpen}"></div>

    <div class="flex items-start justify-between ">
        <jsp:include page="components/sideBar.jsp"></jsp:include>
        <div class="flex flex-col w-full md:space-y-4">
            <jsp:include page="components/header.jsp"></jsp:include>
            <div style="width: 100%;" class="container w-full md:w-4/5  mx-auto px-2">

                <!--Title-->
                <h1 class="flex items-center bg-white shadow-sm rounded font-sans font-bold break-normal  px-5 text-blue-700 py-4 mb-5 text-xl md:text-2xl">
                    Liste des promotion
                </h1>


                <!--Card-->
                <div id='recipients' class="p-8 mt-6 lg:mt-0 rounded shadow bg-white">


                    <table id="example" class="stripe hover" style="width:100%; display: block; height: 200px; padding-top: 1em; overflow: scroll;  padding-bottom: 1em;">
                        <thead style="position: sticky;">
                        <tr>
                            <th data-priority="1">Date de creation</th>
                            <th data-priority="3">Produit</th>
                            <th data-priority="4">Prix unitaire DH</th>
                            <th data-priority="5">En promotion DH</th>
                            <th data-priority="6">Fidelite</th>
                            <th data-priority="7">Date d'expiration</th>
                            <th data-priority="8">Etat</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="promotion" items="${promotions}">
                            <tr>
                                <td>---</td>
                                <td>${promotion.produitByProduitId.label}</td>
                                <td>${promotion.getProduitByProduitId().getPrix()}</td>
                                <td>${promotion.getProduitByProduitId().getPrix() - (promotion.getProduitByProduitId().getPrix()* promotion.taux / 100 ) }</td>
                                <td>${promotion.profit}</td>
                                <td>${promotion.expired_at}</td>
                                <td>
<%--                                    <div style="--%>
<%--                                            background: <c:if test="${promotion.status.equals('APP')}"> #10b981</c:if>--%>
<%--                                    <c:if test="${promotion.status.equals('ENC')}"> #0891b2</c:if>--%>
<%--                                    <c:if test="${promotion.status.equals('NOT')}"> #fde68a</c:if>--%>
<%--                                    <c:if test="${promotion.status.equals('REJ')}"> #f87171</c:if>;"--%>
<%--                                         class="flex  w-full max-w-sm overflow-hidden text-white rounded-full py-1">--%>
<%--                                        <div>--%>
<%--                                            <div class="mx-3">--%>
<%--                                                <span style="font-size: 0.6em;" class="font-bold  text-sm">--%>
<%--                                                    <c:if test="${promotion.status.equals('APP')}"> APPLIQUEE</c:if>--%>
<%--                                                    <c:if test="${promotion.status.equals('ENC')}"> E.COURS</c:if>--%>
<%--                                                    <c:if test="${promotion.status.equals('NOT')}"> N.TRAITEE</c:if>--%>
<%--                                                    <c:if test="${promotion.status.equals('REJ')}"> REJETEE</c:if>--%>
<%--                                                </span>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
                                    <div class="flex items-center">
                                        <div class="relative">
                                        <c:if test="${promotion.status.equals('ENC')}">
                                            <a href="accept.promo.responsable?promo=${promotion.id}"  class="relative z-10  text-medium mr-4">
                                                <i  class="fa-solid fa-circle-check text-blue-500 "></i>
                                            </a>

                                            <a href="decline.promo.responsable?promo=${promotion.id}"  class="relative z-10  text-medium">
                                            <i style="color: #ef4444;" class="fa-regular fa-circle-xmark"></i>
                                            </a>
                                        </c:if>

                                            <div style="
                                                    background: <c:if test="${promotion.status.equals('APP')}"> #10b981</c:if>
                                            <c:if test="${promotion.status.equals('NOT')}"> #fde68a</c:if>
                                            <c:if test="${promotion.status.equals('REJ')}"> #f87171</c:if>;"
                                                 class="flex  w-full max-w-sm overflow-hidden text-white rounded-full py-1">
                                                <div>
                                                    <div class="mx-3">
                                                        <span style="font-size: 0.6em;" class="font-bold  text-sm">
                                                            <c:if test="${promotion.status.equals('APP')}"> APPLIQUEE</c:if>
                                                            <c:if test="${promotion.status.equals('NOT')}"> N.TRAITEE</c:if>
                                                            <c:if test="${promotion.status.equals('REJ')}"> REJETEE</c:if>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </td>
                            </tr>

                        </c:forEach>
                        <!-- Rest of your data (refer to https://datatables.net/examples/server_side/ for server side processing)-->

                        </tbody>
                    </table>
                </div>
                <!--/Card-->
            </div>
            <!-- jQuery -->
            <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <!--Datatables -->
            <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
            <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
            <script>
                $(document).ready(function() {

                    var table = $('#example').DataTable({
                        responsive: true
                    })
                        .columns.adjust()
                        .responsive.recalc();
                });
            </script>
        </div>

    </div>
</main>

</body>
</html>
