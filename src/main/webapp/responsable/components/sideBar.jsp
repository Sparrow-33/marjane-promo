<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="h-screen hidden lg:block my-4 ml-4 shadow-lg relative w-80 ">
    <div class="bg-white h-full rounded-2xl dark:bg-gray-700">
        <div class="flex items-center justify-center pt-6">
            <img src="<c:url value='/images/logo_marjane.svg'/>" class="h-24" alt=.../>
        </div>
        <nav class="mt-6 px-2 ">
            <div>
                <a href="index.responsable"
                   class="w-full font-thin uppercase text-gray-500 flex items-center p-4 my-2 transition-colors duration-200 justify-start hover:bg-blue-700 hover:text-white rounded-full " href="#">
                            <span class="text-left">
                                <svg width="20" height="20" fill="currentColor" viewBox="0 0 2048 1792" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M1070 1178l306-564h-654l-306 564h654zm722-282q0 182-71 348t-191 286-286 191-348 71-348-71-286-191-191-286-71-348 71-348 191-286 286-191 348-71 348 71 286 191 191 286 71 348z">
                                    </path>
                                </svg>
                            </span>
                    <span class="mx-4 text-sm font-normal">
                                Dashboard
                            </span>
                </a>
                <a href="display.products.responsable"  class="w-full font-thin uppercase text-gray-500 dark:text-gray-200 flex items-center p-4 my-2 transition-colors duration-200 justify-start hover:bg-blue-700 hover:text-white rounded-full" >
                            <span class="text-left">
                              <i class="fa-solid fa-shop"></i>
                            </span>
                    <span class="mx-4 text-sm font-normal">
                                Produits
                           </span>
                </a>

                <a href="display.promo.responsable"  class="w-full font-thin uppercase text-gray-500 dark:text-gray-200 flex items-center p-4 my-2 transition-colors duration-200 justify-start hover:bg-blue-700 hover:text-white rounded-full" href="#">
                <span class="text-left">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
            </svg>
                </span>
                    <span class="mx-2 text-sm font-normal">
                   Promotions
              </span>
                </a>
            </div>
        </nav>
    </div>
</div>
