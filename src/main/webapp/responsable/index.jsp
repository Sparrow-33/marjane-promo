<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<jsp:include page="components/head.jsp"></jsp:include>
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
        <jsp:include page="components/sideBar.jsp"></jsp:include>
        <div class="flex flex-col w-full md:space-y-4">
        <jsp:include page="components/header.jsp"></jsp:include>

            <div class="overflow-auto h-screen pb-24 px-4 md:px-6"
                 x-show = "index">
                <h1 class="text-4xl font-semibold text-gray-800 dark:text-white">
                    Responsable
                </h1>

                <div class="flex my-6 items-center w-full space-y-4 md:space-x-4 md:space-y-0 flex-col md:flex-row">
                    <div class="w-full md:w-6/12">
                        <div class="shadow-sm rounded w-full bg-white dark:bg-gray-700 relative overflow-hidden">
                            <a href="#" class="w-full h-full block">
                                <div class="flex items-center justify-between px-4 py-6 space-x-4">
                                    <div class="flex items-center">
                                        <span class="rounded-full relative p-5 bg-yellow-100">
                                            <svg width="40" fill="currentColor" height="40" class="text-yellow-500 h-5 absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M1362 1185q0 153-99.5 263.5t-258.5 136.5v175q0 14-9 23t-23 9h-135q-13 0-22.5-9.5t-9.5-22.5v-175q-66-9-127.5-31t-101.5-44.5-74-48-46.5-37.5-17.5-18q-17-21-2-41l103-135q7-10 23-12 15-2 24 9l2 2q113 99 243 125 37 8 74 8 81 0 142.5-43t61.5-122q0-28-15-53t-33.5-42-58.5-37.5-66-32-80-32.5q-39-16-61.5-25t-61.5-26.5-62.5-31-56.5-35.5-53.5-42.5-43.5-49-35.5-58-21-66.5-8.5-78q0-138 98-242t255-134v-180q0-13 9.5-22.5t22.5-9.5h135q14 0 23 9t9 23v176q57 6 110.5 23t87 33.5 63.5 37.5 39 29 15 14q17 18 5 38l-81 146q-8 15-23 16-14 3-27-7-3-3-14.5-12t-39-26.5-58.5-32-74.5-26-85.5-11.5q-95 0-155 43t-60 111q0 26 8.5 48t29.5 41.5 39.5 33 56 31 60.5 27 70 27.5q53 20 81 31.5t76 35 75.5 42.5 62 50 53 63.5 31.5 76.5 13 94z">
                                                </path>
                                            </svg>
                                        </span>
                                        <p class="text-sm text-gray-700 dark:text-white ml-2 font-semibold border-b border-gray-200">
                                            valeur des produits
                                        </p>
                                    </div>
                                    <div class="border-b border-gray-200 mt-6 md:mt-0 text-black dark:text-white font-bold text-xl">
                                        $44,453.39
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="flex items-center w-full md:w-1/2 space-x-4">
                        <div class="w-1/2">
                            <div class="shadow-sm rounded px-4 py-6 w-full bg-white dark:bg-gray-700 relative">
                                <p class="text-2xl text-black dark:text-white font-bold">
                                    12
                                </p>
                                <p class="text-gray-400 text-sm">
                                    nombre des promotions
                                </p>
                            </div>
                        </div>
                        <div class="w-1/2">
                            <div class="shadow-sm rounded px-4 py-6 w-full bg-white dark:bg-gray-700 relative">
                                <p class="text-2xl text-black dark:text-white font-bold">
                                    $93.76
                                </p>
                                <p class="text-gray-400 text-sm">
                                    valeur des promotions
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 my-4">
                    <div class="w-full">
                        <div class="shadow-sm rounded px-4 py-6 w-full bg-white dark:bg-gray-700 relative">
                            <p class="text-sm w-max text-gray-700 dark:text-white font-semibold border-b border-gray-200">
                                Multimedia
                            </p>
                            <div class="flex items-end space-x-2 my-6">
                                <p class="text-5xl text-black dark:text-white font-bold">
                                    12
                                </p>
                            </div>

                        </div>
                    </div>
                    <div class="w-full">
                        <div class="shadow-sm rounded px-4 py-6 w-full bg-white dark:bg-gray-700 relative">
                            <p class="text-sm w-max text-gray-700 dark:text-white font-semibold border-b border-gray-200">
                                Charcuterie
                            </p>
                            <div class="flex items-end space-x-2 my-6">
                                <p class="text-5xl text-black dark:text-white font-bold">
                                    23
                                </p>
                            </div>

                        </div>
                    </div>
                    <div class="w-full">
                        <div class="shadow-sm rounded px-4 py-6 w-full bg-white dark:bg-gray-700 relative">
                            <p class="text-sm w-max text-gray-700 dark:text-white font-semibold border-b border-gray-200">
                                Textile
                            </p>
                            <div class="flex items-end space-x-2 my-6">
                                <p class="text-5xl text-black dark:text-white font-bold">
                                    12
                                </p>
                            </div>

                        </div>
                    </div>
                    <div class="w-full">
                        <div class="shadow-sm rounded px-4 py-6 w-full bg-white dark:bg-gray-700 relative">
                            <p class="text-sm w-max text-gray-700 dark:text-white font-semibold border-b border-gray-200">
                                Fromagerie
                            </p>
                            <div class="flex items-end space-x-2 my-6">
                                <p class="text-5xl text-black dark:text-white font-bold">
                                    16
                                </p>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

</body>
</html>
