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

(declare-fun id (Int) Int)

(declare-fun id__function_guard (Int Int) Bool)

(declare-sort my_integer 0)

(declare-fun my_integerqtint (my_integer) Int)

;; my_integer'axiom
  (assert
  (forall ((i my_integer))
  (and (<= (- 2147483648) (my_integerqtint i))
  (<= (my_integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (my_integer my_integer) Bool)

(declare-const dummy my_integer)

(declare-datatypes ()
((my_integer__ref (my_integer__refqtmk (my_integer__content my_integer)))))
(define-fun my_integer__ref_my_integer__content__projection ((a my_integer__ref)) my_integer 
  (my_integer__content a))

(define-fun dynamic_invariant ((temp___expr_181 Int)
  (temp___is_init_177 Bool) (temp___skip_constant_178 Bool)
  (temp___do_toplevel_179 Bool)
  (temp___do_typ_inv_180 Bool)) Bool (=>
                                     (or (= temp___is_init_177 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range temp___expr_181)))

;; id__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (id x)))
     (=> (id__function_guard result x) (dynamic_invariant result true false
     true true)))) :pattern ((id x)) )))

(declare-const c Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort tmy_integerB 0)

(declare-fun tmy_integerBqtint (tmy_integerB) Int)

;; tmy_integerB'axiom
  (assert
  (forall ((i tmy_integerB))
  (and (<= (- 2147483648) (tmy_integerBqtint i))
  (<= (tmy_integerBqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (tmy_integerB tmy_integerB) Bool)

(declare-const dummy1 tmy_integerB)

(declare-datatypes ()
((tmy_integerB__ref
 (tmy_integerB__refqtmk (tmy_integerB__content tmy_integerB)))))
(define-fun tmy_integerB__ref_tmy_integerB__content__projection ((a tmy_integerB__ref)) tmy_integerB 
  (tmy_integerB__content a))

(define-fun to_rep ((x tmy_integerB)) Int (tmy_integerBqtint x))

(declare-fun of_rep (Int) tmy_integerB)

;; inversion_axiom
  (assert
  (forall ((x tmy_integerB))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x tmy_integerB)) (! (in_range1
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-const first Int)

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (tmy_integerB tmy_integerB) Bool)

(declare-const dummy2 tmy_integerB)

(declare-datatypes ()
((my_natural__ref (my_natural__refqtmk (my_natural__content tmy_integerB)))))
(define-fun my_natural__ref_my_natural__content__projection ((a my_natural__ref)) tmy_integerB 
  (my_natural__content a))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(define-fun to_rep1 ((x my_integer)) Int (my_integerqtint x))

(declare-fun of_rep1 (Int) my_integer)

;; inversion_axiom
  (assert
  (forall ((x my_integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x my_integer)) (! (in_range
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                             (of_rep1 x))) )))

(define-fun dynamic_invariant1 ((temp___expr_188 Int)
  (temp___is_init_184 Bool) (temp___skip_constant_185 Bool)
  (temp___do_toplevel_186 Bool)
  (temp___do_typ_inv_187 Bool)) Bool (=>
                                     (or (= temp___is_init_184 true)
                                     (<= first 2147483647)) (dynamic_property
                                     first 2147483647 temp___expr_188)))

;; first__def_axiom
  (assert (= first c))

(define-fun in_range2 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Bool)

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (rec__alloc_range_check__int_ptr__is_null_pointer Bool)(rec__alloc_range_check__int_ptr__pointer_address Int)(rec__alloc_range_check__int_ptr__pointer_value tmy_integerB)))))
(define-fun us_rep_rec__alloc_range_check__int_ptr__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__alloc_range_check__int_ptr__is_null_pointer a))

(define-fun us_rep_rec__alloc_range_check__int_ptr__pointer_address__projection ((a us_rep)) Int 
  (rec__alloc_range_check__int_ptr__pointer_address a))

(define-fun us_rep_rec__alloc_range_check__int_ptr__pointer_value__projection ((a us_rep)) tmy_integerB 
  (rec__alloc_range_check__int_ptr__pointer_value a))

(declare-datatypes ()
((us_rep__ref (us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__alloc_range_check__int_ptr__is_null_pointer
                           a) (rec__alloc_range_check__int_ptr__is_null_pointer
                              b))
                        (=>
                        (not
                        (= (rec__alloc_range_check__int_ptr__is_null_pointer
                           a) true))
                        (and
                        (= (rec__alloc_range_check__int_ptr__pointer_address
                           a) (rec__alloc_range_check__int_ptr__pointer_address
                              b))
                        (= (rec__alloc_range_check__int_ptr__pointer_value a) 
                        (rec__alloc_range_check__int_ptr__pointer_value b)))))
                   true false))

(define-fun rec__alloc_range_check__int_ptr__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__alloc_range_check__int_ptr__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__alloc_range_check__int_ptr__is_null_pointer us_null_pointer) true))

(declare-const dummy3 us_rep)

(declare-datatypes ()
((int_ptr__ref (int_ptr__refqtmk (int_ptr__content us_rep)))))
(define-fun int_ptr__ref_int_ptr__content__projection ((a int_ptr__ref)) us_rep 
  (int_ptr__content a))

(define-fun dynamic_invariant2 ((temp___expr_195 us_rep)
  (temp___is_init_191 Bool) (temp___skip_constant_192 Bool)
  (temp___do_toplevel_193 Bool)
  (temp___do_typ_inv_194 Bool)) Bool (=>
                                     (not
                                     (= (rec__alloc_range_check__int_ptr__is_null_pointer
                                        temp___expr_195) true))
                                     (dynamic_property first 2147483647
                                     (to_rep
                                     (rec__alloc_range_check__int_ptr__pointer_value
                                     temp___expr_195)))))

(define-fun default_initial_assumption ((temp___expr_196 us_rep)
  (temp___skip_top_level_197 Bool)) Bool (= (rec__alloc_range_check__int_ptr__is_null_pointer
                                            temp___expr_196) true))

;; c__def_axiom
  (assert (and (id__function_guard (id 0) 0) (= c (id 0))))

(define-fun alloc_range_check__c__assume () Int (id 0))

;; H
  (assert (id__function_guard alloc_range_check__c__assume 0))

;; H
  (assert (dynamic_invariant alloc_range_check__c__assume true false true
  true))

;; Assume
  (assert (= alloc_range_check__c__assume c))

;; Assume
  (assert (dynamic_invariant c true false true true))

(declare-const j Int)

;; H
  (assert (= j (- 3)))

;; Assume
  (assert (dynamic_invariant j true false true true))

;; Ensures
  (assert (in_range (- 1)))

(declare-const us_next_pointer_address Int)

(declare-const temp___alloc_199 us_rep)

;; H
  (assert
  (not
  (= (rec__alloc_range_check__int_ptr__is_null_pointer temp___alloc_199) true)))

;; H
  (assert
  (= (rec__alloc_range_check__int_ptr__pointer_address temp___alloc_199) 
  us_next_pointer_address))

(declare-const usf my_integer)

;; Ensures
  (assert (= (to_rep1 usf) (- 1)))

(declare-const temp___200 Int)

;; Ensures
  (assert (= (to_rep1 usf) temp___200))

(define-fun o () Int 2147483647)

(define-fun o1 () Int first)

(assert
;; defqtvc
 ;; File "alloc_range_check.adb", line 1, characters 0-0
  (not (dynamic_property o1 o temp___200)))
(check-sat)
