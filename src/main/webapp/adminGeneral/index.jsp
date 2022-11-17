<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<jsp:include page="../components/head.jsp"></jsp:include>
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
                <p class="text-sm text-gray-600 dark:text-gray-200">Your account was registered!</p>
            </div>
        </div>
    </div>
    </c:if>
<%-- alert end--%>
<div :class="{'absolute h-full w-full bg-white backdrop-filter backdrop-blur-lg bg-opacity-20 z-30': modelOpen}"></div>
  <div class="flex items-start justify-between ">
    <div class="h-screen hidden lg:block my-4 ml-4 shadow-lg relative w-80">
      <div class="bg-white h-full rounded-2xl dark:bg-gray-700">
        <div class="flex items-center justify-center pt-6">
            <img src="<c:url value='../images/logo_marjane.svg'/>" class="h-24" alt=.../>
        </div>
        <nav class="mt-6">
          <div>
            <button @click ="displayPromo = false, index = true"
                    class="w-full font-thin uppercase text-gray-500 flex items-center p-4 my-2 transition-colors duration-200 justify-start hover:bg-blue-700 hover:text-white rounded-full" href="#">
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
            <a class="w-full font-thin uppercase text-gray-500 dark:text-gray-200 flex items-center p-4 my-2 transition-colors duration-200 justify-start hover:bg-blue-700 hover:text-white rounded-full" href="#">
                            <span class="text-left">
                                <svg width="20" height="20" fill="currentColor" class="m-auto" viewBox="0 0 2048 1792" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M1024 1131q0-64-9-117.5t-29.5-103-60.5-78-97-28.5q-6 4-30 18t-37.5 21.5-35.5 17.5-43 14.5-42 4.5-42-4.5-43-14.5-35.5-17.5-37.5-21.5-30-18q-57 0-97 28.5t-60.5 78-29.5 103-9 117.5 37 106.5 91 42.5h512q54 0 91-42.5t37-106.5zm-157-520q0-94-66.5-160.5t-160.5-66.5-160.5 66.5-66.5 160.5 66.5 160.5 160.5 66.5 160.5-66.5 66.5-160.5zm925 509v-64q0-14-9-23t-23-9h-576q-14 0-23 9t-9 23v64q0 14 9 23t23 9h576q14 0 23-9t9-23zm0-260v-56q0-15-10.5-25.5t-25.5-10.5h-568q-15 0-25.5 10.5t-10.5 25.5v56q0 15 10.5 25.5t25.5 10.5h568q15 0 25.5-10.5t10.5-25.5zm0-252v-64q0-14-9-23t-23-9h-576q-14 0-23 9t-9 23v64q0 14 9 23t23 9h576q14 0 23-9t9-23zm256-320v1216q0 66-47 113t-113 47h-352v-96q0-14-9-23t-23-9h-64q-14 0-23 9t-9 23v96h-768v-96q0-14-9-23t-23-9h-64q-14 0-23 9t-9 23v96h-352q-66 0-113-47t-47-113v-1216q0-66 47-113t113-47h1728q66 0 113 47t47 113z">
                                    </path>
                                </svg>
                            </span>
              <span class="mx-4 text-sm font-normal">
                                Liste des centres
              </span>
            </a>
            <button @click="modelOpen = true" class="w-full font-thin uppercase text-gray-500 dark:text-gray-200 flex items-center p-4 my-2 transition-colors duration-200 justify-start hover:bg-blue-700 hover:text-white rounded-full" href="#">
                <i class="fa-solid fa-user-plus"></i>
              <span class="mx-4 text-sm font-normal">
                                Ajouter admin
              </span>
            </button>
          </div>
        </nav>
      </div>
    </div>

      <div class="flex flex-col w-full md:space-y-4">
          <header class="w-full h-16 z-40 flex align-center items-center justify-between px-5 py-2 ">
              <div class="bg-white shadow-sm rounded  relative  z-20 flex align-center flex-col justify-end h-full px-3 md:w-full">
                  <div class="relative flex align-center p-1 flex items-center w-full space-x-4 justify-end">
                      <form action="logout.adminGeneral" method="post">
                      <button type="submit" class="flex items-center font-semibold mr-4 p-2 text-blue-700 hover:bg-blue-700 rounded hover:text-white">
                          <span class="mr-4">LogOut</span>
                          <i class="fa-solid fa-arrow-right-from-bracket"></i>
                      </button>
                      </form>
                  </div>
              </div>
          </header>
      <jsp:include page="/adminGeneral/statistics.jsp"></jsp:include>
      <jsp:include page="/adminGeneral/displayPromo.jsp"></jsp:include>

      </div>

      <%--  Modal start   --%>
      <jsp:include page="/adminGeneral/createAdmin.jsp"></jsp:include>
      <%--  Modal end   --%>

  </div>
</main>

</body>
</html>
