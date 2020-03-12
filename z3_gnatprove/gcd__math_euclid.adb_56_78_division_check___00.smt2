(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun div1 (Int Int) Int)

(declare-fun mod1 (Int Int) Int)

;; Div_mod
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (= x (+ (* y (div1 x y)) (mod1 x y))))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div1 x y)) (<= (div1 x y) x)))))

;; Mod_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0))
  (and (< (- (abs1 y)) (mod1 x y)) (< (mod1 x y) (abs1 y))))))

;; Div_sign_pos
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< 0 y)) (<= 0 (div1 x y)))))

;; Div_sign_neg
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= x 0) (< 0 y)) (<= (div1 x y) 0))))

;; Mod_sign_pos
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (not (= y 0))) (<= 0 (mod1 x y)))))

;; Mod_sign_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= x 0) (not (= y 0))) (<= (mod1 x y) 0))))

;; Rounds_toward_zero
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (<= (abs1 (* (div1 x y) y)) (abs1 x)))))

;; Div_1
  (assert (forall ((x Int)) (= (div1 x 1) x)))

;; Mod_1
  (assert (forall ((x Int)) (= (mod1 x 1) 0)))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div1 x y) 0))))

;; Mod_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (mod1 x y) x))))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (div1 (+ (* x y) z) x) (+ y (div1 z x)))) :pattern ((div1
                                                            (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (mod1 (+ (* x y) z) x) (mod1 z x))) :pattern ((mod1 (+ (* x y) z) x)) )))

(define-fun mod2 ((x Int)
  (y Int)) Int (ite (< 0 y) (mod x y) (+ (mod x y) y)))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (positive positive) Bool)

(declare-const dummy positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

(declare-fun divides (Int Int) Bool)

(declare-fun divides__function_guard (Bool Int Int) Bool)

;; divides__post_axiom
  (assert true)

;; divides__def_axiom
  (assert
  (forall ((a Int) (b Int))
  (! (= (= (divides a b) true) (= (mod2 b a) 0)) :pattern ((divides a b)) )))

(declare-const a Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

;; Assume
  (assert (dynamic_invariant a true false true true))

;; Assume
  (assert (dynamic_invariant b true false true true))

(declare-const x Int)

;; H
  (assert (= x 1))

;; H
  (assert
  (= (and (ite (<= 1 x) true false) (ite (<= x 2147483647) true false)) true))

(declare-const spark__branch Bool)

;; H
  (assert
  (forall ((x1 Int) (o Int) (o1 Int)) (divides__function_guard
  (divides x1 (mod2 o1 o)) x1 (mod2 o1 o))))

;; H
  (assert (let ((o a)) (divides__function_guard (divides x o) x o)))

;; H
  (assert (let ((o a)) (= (= (divides x o) true) (= (mod2 o x) 0))))

;; H
  (assert
  (let ((o (divides x a)))
  (let ((o1 (ite (= o true) (divides x b) false)))
  (or (not (= o true))
  (let ((o2 b))
  (and (divides__function_guard o1 x o2) (= (= o1 true) (= (mod2 o2 x) 0))))))))

(declare-const o Bool)

;; H
  (assert
  (ite (= (ite (= (divides x a) true) (divides x b) false) true)
  (let ((o1 a))
  (let ((o2 b))
  (let ((o3 (divides o2 o1)))
  (and
  (and (divides__function_guard o3 o2 o1) (= (= o3 true) (= (mod2 o1 o2) 0)))
  (= o (ite (= o3 true) false true)))))) (= o false)))

;; H
  (assert (= spark__branch o))

;; H
  (assert (or (not (= spark__branch true)) (= (divides x (mod2 a b)) true)))

(declare-const spark__branch1 Bool)

;; H
  (assert
  (forall ((x1 Int) (o1 Int)) (divides__function_guard (divides x1 o1) x1
  o1)))

;; H
  (assert
  (let ((o1 a))
  (let ((o2 b)) (divides__function_guard (divides o2 o1) o2 o1))))

;; H
  (assert
  (let ((o1 a))
  (let ((o2 b)) (= (= (divides o2 o1) true) (= (mod2 o1 o2) 0)))))

;; H
  (assert
  (let ((o1 (divides b a)))
  (let ((o2 (ite (= o1 true) (divides x b) false)))
  (or (not (= o1 true))
  (let ((o3 b))
  (and (divides__function_guard o2 x o3) (= (= o2 true) (= (mod2 o3 x) 0))))))))

;; H
  (assert
  (= spark__branch1 (ite (= (divides b a) true) (divides x b) false)))

;; H
  (assert (or (not (= spark__branch1 true)) (= (divides x a) true)))

(declare-const spark__branch2 Bool)

;; H
  (assert
  (forall ((x1 Int) (o1 Int)) (divides__function_guard (divides x1 o1) x1
  o1)))

;; H
  (assert
  (let ((o1 a))
  (let ((o2 b)) (divides__function_guard (divides o2 o1) o2 o1))))

;; H
  (assert
  (let ((o1 a))
  (let ((o2 b)) (= (= (divides o2 o1) true) (= (mod2 o1 o2) 0)))))

;; H
  (assert (or (= (divides b a) true) (in_range1 (mod2 a b))))

;; H
  (assert
  (let ((o1 (divides b a)))
  (let ((o2 (ite (not (= o1 true)) (divides x (mod2 a b)) false)))
  (or (= o1 true)
  (let ((o3 (mod2 a b)))
  (and (divides__function_guard o2 x o3) (= (= o2 true) (= (mod2 o3 x) 0))))))))

;; H
  (assert
  (let ((o1 (ite (not (= (divides b a) true)) (divides x (mod2 a b)) false)))
  (let ((o2 (ite (= o1 true) (divides x b) false)))
  (or (not (= o1 true))
  (let ((o3 b))
  (and (divides__function_guard o2 x o3) (= (= o2 true) (= (mod2 o3 x) 0))))))))

;; H
  (assert
  (= spark__branch2 (ite (= (ite (not (= (divides b a) true))
                            (divides x (mod2 a b)) false) true)
                    (divides x b) false)))

;; H
  (assert (or (not (= spark__branch2 true)) (= (divides x a) true)))

(declare-const usf Int)

;; H
  (assert
  (= (and (ite (<= 1 usf) true false) (ite (<= usf x) true false)) true))

(define-fun o1 () Int b)

(define-fun o2 () Bool (divides usf o1))

;; H
  (assert (divides__function_guard o2 usf o1))

;; H
  (assert (= (= o2 true) (= (mod2 o1 usf) 0)))

;; H
  (assert (= o2 true))

(define-fun o3 () Int a)

(define-fun o4 () Int b)

(define-fun o5 () Bool (divides o4 o3))

;; H
  (assert (divides__function_guard o5 o4 o3))

;; H
  (assert (= (= o5 true) (= (mod2 o3 o4) 0)))

;; H
  (assert (not (= o5 true)))

(define-fun o6 () Int b)

(assert
;; defqtvc
 ;; File "math_euclid.adb", line 33, characters 0-0
  (not (not (= o6 0))))
(check-sat)
