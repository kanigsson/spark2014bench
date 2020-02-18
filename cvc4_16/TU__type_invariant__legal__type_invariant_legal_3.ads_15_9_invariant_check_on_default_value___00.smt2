;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-fun f (Int) Bool)

(declare-fun f__function_guard (Bool Int) Bool)

;; temp___result_159'def
  (assert
  (forall ((temp___158 Int)) (f__function_guard (f temp___158) temp___158)))

(define-fun type_invariant ((temp___157 Int)) Bool (= (f temp___157) true))

(declare-sort t1 0)

(declare-fun t1qtint (t1) Int)

;; t1'axiom
  (assert
  (forall ((i t1)) (and (<= 0 (t1qtint i)) (<= (t1qtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (t1 t1) Bool)

(declare-const dummy t1)

(declare-datatypes ((t1__ref 0))
(((t1__refqtmk (t1__content t1)))))
(define-fun t1__ref_t1__content__projection ((a t1__ref)) t1 (t1__content a))

(define-fun dynamic_invariant ((temp___expr_164 Int)
  (temp___is_init_160 Bool) (temp___skip_constant_161 Bool)
  (temp___do_toplevel_162 Bool)
  (temp___do_typ_inv_163 Bool)) Bool (=>
                                     (or (= temp___is_init_160 true)
                                     (<= 0 2147483647)) (in_range
                                     temp___expr_164)))

;; f__post_axiom
  (assert true)

;; f__def_axiom
  (assert (forall ((x Int)) (! (= (f x) true) :pattern ((f x)) )))

(declare-fun f1 (Int) Bool)

(declare-fun f__function_guard1 (Bool Int) Bool)

(declare-fun g (Int) Bool)

(declare-fun g__function_guard (Bool Int) Bool)

(declare-sort t2 0)

(declare-fun t2qtint (t2) Int)

;; t2'axiom
  (assert
  (forall ((i t2)) (and (<= 0 (t2qtint i)) (<= (t2qtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (t2 t2) Bool)

(declare-const dummy1 t2)

(declare-datatypes ((t2__ref 0))
(((t2__refqtmk (t2__content t2)))))
(define-fun t2__ref_t2__content__projection ((a t2__ref)) t2 (t2__content a))

(define-fun dynamic_invariant1 ((temp___expr_174 Int)
  (temp___is_init_170 Bool) (temp___skip_constant_171 Bool)
  (temp___do_toplevel_172 Bool)
  (temp___do_typ_inv_173 Bool)) Bool (=>
                                     (or (= temp___is_init_170 true)
                                     (<= 0 2147483647)) (in_range1
                                     temp___expr_174)))

;; g__post_axiom
  (assert true)

;; g__def_axiom
  (assert
  (forall ((x Int))
  (! (and (forall ((x1 Int)) (f__function_guard1 (f1 x1) x1))
     (= (= (g x) true) (= (f1 x) true))) :pattern ((g x)) )))

;; temp___result_169'def
  (assert
  (forall ((temp___168 Int)) (g__function_guard (g temp___168) temp___168)))

(define-fun type_invariant1 ((temp___167 Int)) Bool (= (g temp___167) true))

;; f__post_axiom
  (assert true)

;; f__def_axiom
  (assert (forall ((x Int)) (! (= (f1 x) true) :pattern ((f1 x)) )))

(assert
;; defqtvc
 ;; File "type_invariant_legal_3.ads", line 4, characters 0-0
  (not
  (forall ((usf Int))
  (=> (dynamic_invariant usf true false true true) (type_invariant usf)))))
(check-sat)