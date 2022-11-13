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
    <div class="h-screen hidden lg:block my-4 ml-4 shadow-lg relative w-80 ">
      <div class="bg-white h-full rounded-2xl dark:bg-gray-700">
        <div class="flex items-center justify-center pt-6">
          <img src="../images/logo_marjane.svg" class="h-24" alt="">
        </div>
        <nav class="mt-6 ">
          <div>
            <button @click ="displayPromo = false, index = true"
                    class="w-full font-thin uppercase text-gray-500 flex items-center p-4 my-2 transition-colors duration-200 justify-start  dark:from-gray-700 dark:to-gray-800 " href="#">
                            <span class="text-left">
                                <svg width="20" height="20" fill="currentColor" viewBox="0 0 2048 1792" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M1070 1178l306-564h-654l-306 564h654zm722-282q0 182-71 348t-191 286-286 191-348 71-348-71-286-191-191-286-71-348 71-348 191-286 286-191 348-71 348 71 286 191 191 286 71 348z">
                                    </path>
                                </svg>
                            </span>
              <span class="mx-4 text-sm font-normal">
                                Dashboard
                            </span>
            </button>
            <a  class="w-full font-thin uppercase text-gray-500 dark:text-gray-200 flex items-center p-4 my-2 transition-colors duration-200 justify-start hover:text-blue-500" href="display.products.admin">
                            <span class="text-left">
                              <i class="fa-solid fa-shop"></i>
                            </span>
              <span class="mx-4 text-sm font-normal">
                                Produits
              </span>
            </a>
            <button @click="modelOpen = true" class="w-full font-thin uppercase text-gray-500 dark:text-gray-200 flex items-center p-4 my-2 transition-colors duration-200 justify-start hover:text-blue-500" href="#">
              <i class="fa-solid fa-user-plus"></i>
              <span class="mx-4 text-sm font-normal">
                                Responsables
              </span>
            </button>


            <button
                    @click ="displayPromo = true, index = false"
                    class="w-full font-thin uppercase text-gray-500 dark:text-gray-200 flex items-center p-4 my-2 transition-colors duration-200 justify-start hover:text-blue-500" href="#">
                <span class="text-left">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
            </svg>
                </span>
              <span class="mx-2 text-sm font-normal">
                   Promotions
              </span>
            </button>
          </div>
        </nav>
      </div>
    </div>

    <div class="flex flex-col w-full md:space-y-4">
      <header class="w-full h-16 z-40 flex items-center justify-between">
        <div class="block lg:hidden ml-6">
          <button class="flex p-2 items-center rounded-full bg-white shadow text-gray-500 text-md">
            <svg width="20" height="20" class="text-gray-400" fill="currentColor" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg">
              <path d="M1664 1344v128q0 26-19 45t-45 19h-1408q-26 0-45-19t-19-45v-128q0-26 19-45t45-19h1408q26 0 45 19t19 45zm0-512v128q0 26-19 45t-45 19h-1408q-26 0-45-19t-19-45v-128q0-26 19-45t45-19h1408q26 0 45 19t19 45zm0-512v128q0 26-19 45t-45 19h-1408q-26 0-45-19t-19-45v-128q0-26 19-45t45-19h1408q26 0 45 19t19 45z">
              </path>
            </svg>
          </button>
        </div>
        <div class="relative z-20 flex flex-col justify-end h-full px-3 md:w-full">
          <div class="relative p-1 flex items-center w-full space-x-4 justify-end">
            <button class="flex p-2 items-center rounded-full text-gray-400 hover:text-gray-700 bg-white shadow text-md">
              <svg width="20" height="20" class="" fill="currentColor" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg">
                <path d="M1520 1216q0-40-28-68l-208-208q-28-28-68-28-42 0-72 32 3 3 19 18.5t21.5 21.5 15 19 13 25.5 3.5 27.5q0 40-28 68t-68 28q-15 0-27.5-3.5t-25.5-13-19-15-21.5-21.5-18.5-19q-33 31-33 73 0 40 28 68l206 207q27 27 68 27 40 0 68-26l147-146q28-28 28-67zm-703-705q0-40-28-68l-206-207q-28-28-68-28-39 0-68 27l-147 146q-28 28-28 67 0 40 28 68l208 208q27 27 68 27 42 0 72-31-3-3-19-18.5t-21.5-21.5-15-19-13-25.5-3.5-27.5q0-40 28-68t68-28q15 0 27.5 3.5t25.5 13 19 15 21.5 21.5 18.5 19q33-31 33-73zm895 705q0 120-85 203l-147 146q-83 83-203 83-121 0-204-85l-206-207q-83-83-83-203 0-123 88-209l-88-88q-86 88-208 88-120 0-204-84l-208-208q-84-84-84-204t85-203l147-146q83-83 203-83 121 0 204 85l206 207q83 83 83 203 0 123-88 209l88 88q86-88 208-88 120 0 204 84l208 208q84 84 84 204z">
                </path>
              </svg>
            </button>
            <button class="flex p-2 items-center rounded-full bg-white shadow text-gray-400 hover:text-gray-700 text-md">
              <svg width="20" height="20" class="text-gray-400" fill="currentColor" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg">
                <path d="M912 1696q0-16-16-16-59 0-101.5-42.5t-42.5-101.5q0-16-16-16t-16 16q0 73 51.5 124.5t124.5 51.5q16 0 16-16zm816-288q0 52-38 90t-90 38h-448q0 106-75 181t-181 75-181-75-75-181h-448q-52 0-90-38t-38-90q50-42 91-88t85-119.5 74.5-158.5 50-206 19.5-260q0-152 117-282.5t307-158.5q-8-19-8-39 0-40 28-68t68-28 68 28 28 68q0 20-8 39 190 28 307 158.5t117 282.5q0 139 19.5 260t50 206 74.5 158.5 85 119.5 91 88z">
                </path>
              </svg>
            </button>
            <span class="w-1 h-8 rounded-lg bg-gray-200">
                        </span>
            <a href="#" class="block relative">
              <img alt="profil" src="/images/person/1.jpg" class="mx-auto object-cover rounded-full h-10 w-10 "/>
            </a>
            <button class="flex items-center text-gray-500 dark:text-white text-md">
              Charlie R
              <svg width="20" height="20" class="ml-2 text-gray-400" fill="currentColor" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg">
                <path d="M1408 704q0 26-19 45l-448 448q-19 19-45 19t-45-19l-448-448q-19-19-19-45t19-45 45-19h896q26 0 45 19t19 45z">
                </path>
              </svg>
            </button>
          </div>
        </div>
      </header>


      <jsp:include page="/admin/displayPromo.jsp"></jsp:include>
    </div>
    <%--  Modal start   --%>
    <jsp:include page="/admin/createResponsable.jsp"></jsp:include>
    <%--  Modal end   --%>
  </div>
</main>

</body>
</html>
