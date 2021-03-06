(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort my_int 0)

(declare-fun my_intqtint (my_int) Int)

;; my_int'axiom
  (assert
  (forall ((i my_int))
  (and (<= (- 2147483648) (my_intqtint i)) (<= (my_intqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (my_int my_int) Bool)

(declare-const dummy my_int)

(declare-datatypes ((my_int__ref 0))
(((my_int__refqtmk (my_int__content my_int)))))
(define-fun my_int__ref_my_int__content__projection ((a my_int__ref)) my_int 
  (my_int__content a))

(define-fun to_rep ((x my_int)) Int (my_intqtint x))

(declare-fun of_rep (Int) my_int)

;; inversion_axiom
  (assert
  (forall ((x my_int)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x my_int)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__private_pointer__mode_on__t__is_null_pointer Bool)(rec__private_pointer__mode_on__t__pointer_address Int)(rec__private_pointer__mode_on__t__pointer_value my_int)))))
(define-fun us_rep_rec__private_pointer__mode_on__t__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__private_pointer__mode_on__t__is_null_pointer a))

(define-fun us_rep_rec__private_pointer__mode_on__t__pointer_address__projection ((a us_rep)) Int 
  (rec__private_pointer__mode_on__t__pointer_address a))

(define-fun us_rep_rec__private_pointer__mode_on__t__pointer_value__projection ((a us_rep)) my_int 
  (rec__private_pointer__mode_on__t__pointer_value a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__private_pointer__mode_on__t__is_null_pointer
                           a) (rec__private_pointer__mode_on__t__is_null_pointer
                              b))
                        (=>
                        (not
                        (= (rec__private_pointer__mode_on__t__is_null_pointer
                           a) true))
                        (and
                        (= (rec__private_pointer__mode_on__t__pointer_address
                           a) (rec__private_pointer__mode_on__t__pointer_address
                              b))
                        (= (rec__private_pointer__mode_on__t__pointer_value
                           a) (rec__private_pointer__mode_on__t__pointer_value
                              b)))))
                   true false))

(define-fun rec__private_pointer__mode_on__t__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__private_pointer__mode_on__t__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__private_pointer__mode_on__t__is_null_pointer us_null_pointer) true))

(declare-const dummy1 us_rep)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(declare-fun is_null (us_rep) Bool)

(declare-fun is_null__function_guard (Bool us_rep) Bool)

(define-fun default_initial_assumption ((temp___expr_170 us_rep)
  (temp___skip_top_level_171 Bool)) Bool (= (rec__private_pointer__mode_on__t__is_null_pointer
                                            temp___expr_170) true))

;; is_null__post_axiom
  (assert true)

;; is_null__def_axiom
  (assert
  (forall ((x us_rep))
  (! (= (= (is_null x) true) (= (bool_eq x us_null_pointer) true)) :pattern (
  (is_null x)) )))

(define-fun dynamic_invariant ((temp___expr_162 Int)
  (temp___is_init_158 Bool) (temp___skip_constant_159 Bool)
  (temp___do_toplevel_160 Bool)
  (temp___do_typ_inv_161 Bool)) Bool (=>
                                     (or (= temp___is_init_158 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range1 temp___expr_162)))

(assert
;; defqtvc
 ;; File "private_pointer.ads", line 8, characters 0-0
  (not
  (forall ((temp___alloc_208 us_rep) (usf my_int)
  (private_pointer__mode_on__uninit_alloc__result us_rep))
  (=> (in_range1 0)
  (=>
  (not
  (= (rec__private_pointer__mode_on__t__is_null_pointer temp___alloc_208) true))
  (=> (= (to_rep usf) 0)
  (=>
  (= (rec__private_pointer__mode_on__t__pointer_value temp___alloc_208) usf)
  (=> (= private_pointer__mode_on__uninit_alloc__result temp___alloc_208)
  (=>
  (forall ((private_pointer__mode_on__uninit_alloc__result1 us_rep))
  (is_null__function_guard
  (is_null private_pointer__mode_on__uninit_alloc__result1)
  private_pointer__mode_on__uninit_alloc__result1))
  (not (= (is_null private_pointer__mode_on__uninit_alloc__result) true)))))))))))
(check-sat)
(exit)
