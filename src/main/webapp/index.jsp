<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" referrerpolicy="no-referrer" />
    <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <title>marjane management</title>
</head>
<body>
<section class="min-h-screen bg-cover " style="background-image: url('https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')">
    <div class="flex flex-col min-h-screen bg-black/60">
        <div class="container flex flex-col flex-1 px-6 py-12 mx-auto">
            <div class="flex-1 flex-col lg:flex lg:items-center lg:-mx-6 ">
                <div class=" flex flex-col align-center text-white lg:w-1/2 lg:mx-6 ">
                    <img src="images/logo_marjane.svg" class="h-40 mb-0 z-10" alt="">
                    <h1 class="text-sm  font-semibold capitalize mb-10 lg:text-2xl">j'y vais, j'y gagne !</h1>
                </div>
                <div class="w-full max-w-sm mx-auto overflow-hidden bg-white backdrop-filter backdrop-blur-lg bg-opacity-20 rounded-lg shadow-md dark:bg-gray-800">
                    <div class="px-6 py-4">
                        <div x-data="{ isOpen: true }" class="flex items-center">

                            <div class="relative">
                                <!-- Menu toggle button -->
                                <button @click="isOpen = !isOpen" class="relative ml-72 mb-5 z-10 block p-2 text-white transition-colors duration-300 transform bg-gray-400 rounded-md hover:bg-blue-500 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-80">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" viewBox="0 0 20 20" fill="currentColor">
                                        <path d="M10 6a2 2 0 110-4 2 2 0 010 4zM10 12a2 2 0 110-4 2 2 0 010 4zM10 18a2 2 0 110-4 2 2 0 010 4z" />
                                    </svg>
                                </button>

                                <!-- Menu list -->
                                <div x-show="!isOpen"
                                     @click.away="isOpen = true"
                                     x-transition:enter="transition ease-out duration-100"
                                     x-transition:enter-start="opacity-0 scale-90"
                                     x-transition:enter-end="opacity-100 scale-100"
                                     x-transition:leave="transition ease-in duration-100"
                                     x-transition:leave-start="opacity-100 scale-100"
                                     x-transition:leave-end="opacity-0 scale-90"
                                     class="absolute right-0 z-20 w-48 mt-2 overflow-hidden bg-white rounded-md shadow-xl dark:bg-gray-800"
                                >
                                    <button class="block w-full px-4 py-2 text-sm text-gray-800 transition-colors duration-300 transform border-b dark:text-gray-200 dark:border-gray-500 hover:bg-gray-200 dark:hover:bg-gray-600">Admin General</button>
                                    <button class="block w-full px-4 py-2 text-sm text-gray-800 transition-colors duration-300 transform border-b dark:text-gray-200 dark:border-gray-500 hover:bg-gray-200 dark:hover:bg-gray-600">Admin</button>
                                    <button class="block w-full px-4 py-2 text-sm text-gray-800 transition-colors duration-300 transform dark:text-gray-200 hover:bg-gray-200 dark:hover:bg-gray-600">Responsable de rayon</button>
                                </div>
                            </div>
                        </div>
                    <div>
<%--                        <p class="mt-1 text-center font-semibold text-gray-500 dark:text-gray-400">Admin General</p>--%>
                        <p class="mt-1 text-center font-semibold text-gray-500 dark:text-gray-400">Admin </p>

<%--                        <form class="relative z-0" method="post" action="login.adminGeneral">--%>
                        <form class="relative z-0" method="post" action="login.admin">

                            <div class="w-full mt-4">
                                <input class="block w-full px-4 py-2 mt-2 text-gray-700  bg-white border rounded-md dark:bg-gray-800 dark:border-gray-600 dark:placeholder-gray-400 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-opacity-40 focus:outline-none focus:ring focus:ring-blue-300" type="email" name="email" placeholder="Email Address" aria-label="Email Address" />
                            </div>
                            <div class="w-full mt-4">
                                <input class="block w-full px-4 py-2 mt-2 text-gray-700  bg-white border rounded-md dark:bg-gray-800 dark:border-gray-600 dark:placeholder-gray-400 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-opacity-40 focus:outline-none focus:ring focus:ring-blue-300" type="password" name="password" placeholder="Password" aria-label="Password" />
                            </div>
                            <div class="flex items-center justify-center mt-4">
                                <button type="submit" class="px-4 py-2 leading-5 text-white transition-colors duration-300 transform bg-blue-700 rounded hover:bg-gray-600 focus:outline-none" >connexion</button>
                            </div>
                        </form>
                    </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
</section>
</body>
</html>