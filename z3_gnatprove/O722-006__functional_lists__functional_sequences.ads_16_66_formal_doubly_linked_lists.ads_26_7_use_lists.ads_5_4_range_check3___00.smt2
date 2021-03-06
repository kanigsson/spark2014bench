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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-sort us_rep 0)

(declare-fun bool_eq (us_rep us_rep) Bool)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ()
((sequence__ref (sequence__refqtmk (sequence__content us_rep)))))
(define-fun sequence__ref_sequence__content__2__projection ((a sequence__ref)) us_rep 
  (sequence__content a))

(declare-fun get (us_rep Int) Int)

(declare-fun get__function_guard (Int us_rep Int) Bool)

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= (- 2147483648) (element_typeqtint i))
  (<= (element_typeqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (element_type element_type) Bool)

(declare-const dummy2 element_type)

(declare-datatypes ()
((element_type__ref
 (element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__10__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant ((temp___expr_593 Int)
  (temp___is_init_589 Bool) (temp___skip_constant_590 Bool)
  (temp___do_toplevel_591 Bool)
  (temp___do_typ_inv_592 Bool)) Bool (=>
                                     (or (= temp___is_init_589 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range2 temp___expr_593)))

;; get__post_axiom
  (assert
  (forall ((s us_rep))
  (forall ((n Int)) (! (in_range2 (get s n)) :pattern ((get s n)) ))))

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

;; length__post_axiom
  (assert
  (forall ((s us_rep)) (! (in_range1 (length s)) :pattern ((length s)) )))

(declare-const s1 us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const s2 us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun oeq (us_rep us_rep) Bool)

(declare-fun oeq__function_guard (Bool us_rep us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (and
     (forall ((a1 us_rep) (b1 us_rep)) (oeq__function_guard (oeq a1 b1) a1
     b1)) (= (user_eq1 a b) (oeq a b))) :pattern ((user_eq1 a b)) )))

;; oeq__def_axiom
  (assert
  (forall ((s11 us_rep) (s21 us_rep))
  (! (and (forall ((s12 us_rep)) (length__function_guard (length s12) s12))
     (and (forall ((s22 us_rep)) (length__function_guard (length s22) s22))
     (and (forall ((s12 us_rep)) (length__function_guard (length s12) s12))
     (and
     (forall ((s12 us_rep) (n Int)) (get__function_guard (get s12 n) s12 n))
     (and
     (forall ((s22 us_rep) (n Int)) (get__function_guard (get s22 n) s22 n))
     (= (= (oeq s11 s21) true)
     (and (= (length s11) (length s21))
     (forall ((n Int))
     (=> (and (<= 0 n) (<= n (- (length s11) 1)))
     (= (get s11 n) (get s21 n))))))))))) :pattern ((oeq s11 s21)) )))

;; Assume
  (assert true)

;; Assume
  (assert true)

(define-fun o () us_rep s2)

(define-fun o1 () Int (length o))

;; H
  (assert (length__function_guard o1 o))

;; H
  (assert (dynamic_invariant1 o1 true false true true))

(define-fun o2 () us_rep s1)

(define-fun o3 () Int (length o2))

;; H
  (assert (length__function_guard o3 o2))

;; H
  (assert (dynamic_invariant1 o3 true false true true))

;; H
  (assert (= o3 o1))

(declare-const usf Int)

(define-fun o4 () us_rep s1)

(define-fun o5 () Int (length o4))

;; H
  (assert (length__function_guard o5 o4))

;; H
  (assert (dynamic_invariant1 o5 true false true true))

(define-fun o6 () Int (- o5 1))

(assert
;; defqtvc
 ;; File "functional_sequences.ads", line 14, characters 0-0
  (not (in_range1 o6)))
(check-sat)

(exit)
