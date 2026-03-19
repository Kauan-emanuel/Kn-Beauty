document.addEventListener('DOMContentLoaded', () => {
    // Header Scroll Effect
    const header = document.getElementById('header');
    
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    });

    // Mobile Menu Toggle
    const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
    const closeMenuBtn = document.querySelector('.close-menu-btn');
    const mobileNav = document.getElementById('mobileNav');

    if (mobileMenuBtn && closeMenuBtn && mobileNav) {
        mobileMenuBtn.addEventListener('click', () => {
            mobileNav.classList.add('active');
            document.body.style.overflow = 'hidden'; // Prevent scrolling
        });

        closeMenuBtn.addEventListener('click', () => {
            mobileNav.classList.remove('active');
            document.body.style.overflow = '';
        });

        // Close on overlay click
        mobileNav.addEventListener('click', (e) => {
            if (e.target === mobileNav) {
                mobileNav.classList.remove('active');
                document.body.style.overflow = '';
            }
        });
    }

    // Basic Cart Functionality Simulation
    const addToCartBtns = document.querySelectorAll('.add-to-cart-btn');
    const cartCountElement = document.querySelector('.cart-count');
    let cartCount = 0;

    addToCartBtns.forEach(btn => {
        btn.addEventListener('click', (e) => {
            e.preventDefault();
            cartCount++;
            
            // Animate counter
            cartCountElement.textContent = cartCount;
            cartCountElement.style.transform = 'scale(1.3)';
            
            // Change button text temporarily
            const originalText = btn.textContent;
            btn.textContent = 'Adicionado!';
            btn.style.backgroundColor = 'var(--color-success)';
            btn.style.color = '#fff';
            
            setTimeout(() => {
                cartCountElement.style.transform = 'scale(1)';
                btn.textContent = originalText;
                btn.style.backgroundColor = '';
                btn.style.color = '';
            }, 1000);
        });
    });

    // Newsletter Form Submission Simulation
    const newsletterForm = document.querySelector('.newsletter-form');
    if (newsletterForm) {
        newsletterForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const input = newsletterForm.querySelector('input');
            const btn = newsletterForm.querySelector('button');
            const originalBtnText = btn.textContent;
            
            if(input.value) {
                btn.textContent = 'Enviado!';
                input.value = '';
                
                setTimeout(() => {
                    btn.textContent = originalBtnText;
                }, 3000);
            }
        });
    }
});
