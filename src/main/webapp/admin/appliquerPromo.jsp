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
       displayPromo: false,
       index : true,
       alert : true
                }"
       class="bg-gray-50 dark:bg-gray-800 rounded-2xl h-screen overflow-hidden relative ">

  <%-- alert start--%>
  <c:if test="${status == true }">
    <div x-show="alert"
         x-transition:enter="transition ease-in duration-200"
         x-transition:enter-start="opacity-0 transform -translate-x-40"
         x-transition:enter-end="opacity-100 transform translate-x-0"
         x-transition:leave="transition ease-in duration-200"
         x-transition:leave-start="opacity-100 transform translate-x-0"
         x-transition:leave-end="opacity-0 transform -translate-x-40"
         x-init="setTimeout(() => alert = false, 3000)"
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
<jsp:include page="../components/sideBar.jsp"></jsp:include>
    <div class="flex flex-col w-full md:space-y-4">
<jsp:include page="../components/header.jsp"></jsp:include>
      <section class="max-w-4xl w-full p-6 mx-auto bg-white rounded-md shadow-md dark:bg-gray-800">
        <form action="setPromo.admin" method="post">
          <div class="grid grid-cols-1 gap-6 mt-4 sm:grid-cols-2">
            <div>
              <label class="text-gray-700 dark:text-gray-200" for="pourcentage">Pourcentage %</label>
              <input name="pourcentage"  id="pourcentage" type="number" min="0" class="block w-full px-4 py-2 mt-2 text-gray-700 bg-white border border-gray-200 rounded-md dark:bg-gray-800 dark:text-gray-300 dark:border-gray-600 focus:border-blue-400 focus:ring-blue-300 focus:ring-opacity-40 dark:focus:border-blue-300 focus:outline-none focus:ring">
            </div>

            <div>
              <label class="text-gray-700 dark:text-gray-200" for="points">Points de fidelite</label>
              <input name="points" id="points" type="number" min="0" class="block w-full px-4 py-2 mt-2 text-gray-700 bg-white border border-gray-200 rounded-md dark:bg-gray-800 dark:text-gray-300 dark:border-gray-600 focus:border-blue-400 focus:ring-blue-300 focus:ring-opacity-40 dark:focus:border-blue-300 focus:outline-none focus:ring">
            </div>

            <div>
              <label class="text-gray-700 dark:text-gray-200" for="date">Date d'expiration</label>
              <input id="date" type="date" name="date_expiration" class="block w-full px-4 py-2 mt-2 text-gray-700 bg-white border border-gray-200 rounded-md dark:bg-gray-800 dark:text-gray-300 dark:border-gray-600 focus:border-blue-400 focus:ring-blue-300 focus:ring-opacity-40 dark:focus:border-blue-300 focus:outline-none focus:ring">
            </div>


          </div>

          <div class="flex justify-end mt-6">
            <input type="hidden" name="produit" value="<%= request.getParameter("produit")%>">
            <button type="submit" class="px-8 py-2.5 leading-5 text-white transition-colors duration-300 transform bg-gray-700 rounded-md hover:bg-gray-600 focus:outline-none focus:bg-gray-600">
              <%= request.getParameter("produit")%>
            </button>
          </div>
        </form>
      </section>

    </div>
    <%--  Modal start   --%>
    <jsp:include page="/admin/createResponsable.jsp"></jsp:include>
    <%--  Modal end   --%>
  </div>
</main>

</body>
</html>
