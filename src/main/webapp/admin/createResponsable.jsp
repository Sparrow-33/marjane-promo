<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div  class="relative flex justify-center z-40 ">
  <div x-show="modelOpen"
       @click.away="modelOpen = !modelOpen"
       x-transition:enter="transition duration-300 ease-out"
       x-transition:enter-start="translate-y-4 opacity-0 sm:translate-y-0 sm:scale-95"
       x-transition:enter-end="translate-y-0 opacity-100 sm:scale-100"
       x-transition:leave="transition duration-150 ease-in"
       x-transition:leave-start="translate-y-0 opacity-100 sm:scale-100"
       x-transition:leave-end="translate-y-4 opacity-0 sm:translate-y-0 sm:scale-95"
       class="fixed inset-0 z-10 overflow-y-auto "
       aria-labelledby="modal-title" role="dialog" aria-modal="true"

  >
    <div class="flex items-end justify-center min-h-screen px-4 pt-4 pb-20 text-center sm:block sm:p-0">
      <span class="hidden sm:inline-block sm:h-screen sm:align-middle" aria-hidden="true">&#8203;</span>

      <div class="relative inline-block px-4 pt-5 pb-4 overflow-hidden text-left align-bottom transition-all transform bg-white rounded-lg shadow-xl dark:bg-gray-900 sm:my-8 sm:w-full sm:max-w-sm sm:p-6 sm:align-middle">
        <h3 class="text-lg text-center font-semibold leading-6 text-blue-500 capitalize dark:text-white" id="modal-title">
          <i class="fa-solid fa-plus text-white bg-blue-500 py-1 px-2 rounded-full"></i> responsable rayon
        </h3>
        <form class="mt-4" action="addResponsable.admin" method="post">
          <label for="" class="text-sm text-gray-700 dark:text-gray-200 ">
            Nom complet
            <input type="text" name="nom" id="nom" placeholder="nom du responsable"  class="block w-full px-4 py-3 mb-5 text-sm text-gray-700 bg-white border border-gray-200 rounded-md focus:border-blue-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-300 dark:focus:border-blue-300" />
          </label>

          <label for="" class="text-sm text-gray-700 dark:text-gray-200">
            Rayon a affecter
            <select name="category"  id="" class="block w-full px-4 py-3 text-sm text-gray-700 bg-white border border-gray-200 rounded-md focus:border-blue-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-300 dark:focus:border-blue-300">
              <c:forEach var="category" items="${categories}">
                <option value="${category.id}" >${category.type}</option>
              </c:forEach>
            </select>
          </label>

          <label for="" class="text-sm text-gray-700 dark:text-gray-200">
            Email
            <input type="email" name="email" id="email" placeholder="email du responsable"  class="block w-full px-4 py-3 mb-5 text-sm text-gray-700 bg-white border border-gray-200 rounded-md focus:border-blue-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-300 dark:focus:border-blue-300" />
          </label>

          <label for="" class="text-sm text-gray-700 dark:text-gray-200">
            mot de passe
            <input type="password" name="password" id="password" placeholder="mot de passe"  class="block w-full px-4 py-3 text-sm text-gray-700 bg-white border border-gray-200 rounded-md focus:border-blue-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-300 dark:focus:border-blue-300" />
          </label>

          <div class="mt-4 sm:flex sm:items-center sm:-mx-2">
            <button type="button" @click="modelOpen = false" class="w-full px-4 py-2 text-sm font-medium tracking-wide text-gray-700 capitalize transition-colors duration-300 transform border border-gray-200 rounded-md sm:w-1/2 sm:mx-2 dark:text-gray-200 dark:border-gray-700 dark:hover:bg-gray-800 hover:bg-gray-100 focus:outline-none focus:ring focus:ring-gray-300 focus:ring-opacity-40">
              annuler
            </button>

            <button type="submit" class="w-full px-4 py-2 mt-3 text-sm font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-blue-600 rounded-md sm:mt-0 sm:w-1/2 sm:mx-2 hover:bg-blue-500 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40">
              inviter
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

