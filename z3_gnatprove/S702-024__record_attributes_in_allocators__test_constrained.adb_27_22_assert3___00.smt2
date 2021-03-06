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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ()
((us_split_discrs (us_split_discrsqtmk (rec__test_constrained__r__b Bool)))))
(define-fun us_split_discrs_rec__test_constrained__r__b__projection ((a us_split_discrs)) Bool 
  (rec__test_constrained__r__b a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk (rec__test_constrained__r__x integer)))))
(define-fun us_split_fields_rec__test_constrained__r__x__projection ((a us_split_fields)) integer 
  (rec__test_constrained__r__x a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__test_constrained__r__b
                                (us_split_discrs1 a)) 1 0) (ite (rec__test_constrained__r__b
                                                                (us_split_discrs1
                                                                b)) 1 0))
                        (= (to_rep
                           (rec__test_constrained__r__x (us_split_fields1 a))) 
                        (to_rep
                        (rec__test_constrained__r__x (us_split_fields1 b)))))
                   true false))

(define-fun in_range2 ((rec__test_constrained__r__b1 Bool)
  (a us_split_discrs)) Bool (= rec__test_constrained__r__b1 (rec__test_constrained__r__b
                                                            a)))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const test_constrained__r__b__first__bit Int)

(declare-const test_constrained__r__b__last__bit Int)

(declare-const test_constrained__r__b__position Int)

;; test_constrained__r__b__first__bit_axiom
  (assert (<= 0 test_constrained__r__b__first__bit))

;; test_constrained__r__b__last__bit_axiom
  (assert
  (< test_constrained__r__b__first__bit test_constrained__r__b__last__bit))

;; test_constrained__r__b__position_axiom
  (assert (<= 0 test_constrained__r__b__position))

(declare-const test_constrained__r__x__first__bit Int)

(declare-const test_constrained__r__x__last__bit Int)

(declare-const test_constrained__r__x__position Int)

;; test_constrained__r__x__first__bit_axiom
  (assert (<= 0 test_constrained__r__x__first__bit))

;; test_constrained__r__x__last__bit_axiom
  (assert
  (< test_constrained__r__x__first__bit test_constrained__r__x__last__bit))

;; test_constrained__r__x__position_axiom
  (assert (<= 0 test_constrained__r__x__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes () ((r__ref (r__refqtmk (r__content us_rep)))))
(define-fun r__ref_r__content__projection ((a r__ref)) us_rep (r__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ()
((us_rep1
 (us_repqtmk1
 (rec__test_constrained__r_acc__is_null_pointer Bool)(rec__test_constrained__r_acc__pointer_address Int)(rec__test_constrained__r_acc__pointer_value us_rep)))))
(define-fun us_rep_rec__test_constrained__r_acc__is_null_pointer__projection ((a us_rep1)) Bool 
  (rec__test_constrained__r_acc__is_null_pointer a))

(define-fun us_rep_rec__test_constrained__r_acc__pointer_address__projection ((a us_rep1)) Int 
  (rec__test_constrained__r_acc__pointer_address a))

(define-fun us_rep_rec__test_constrained__r_acc__pointer_value__projection ((a us_rep1)) us_rep 
  (rec__test_constrained__r_acc__pointer_value a))

(declare-datatypes ()
((us_rep__ref (us_rep__refqtmk (us_rep__content us_rep1)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep1 
  (us_rep__content a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (rec__test_constrained__r_acc__is_null_pointer a) 
                         (rec__test_constrained__r_acc__is_null_pointer b))
                         (=>
                         (not
                         (= (rec__test_constrained__r_acc__is_null_pointer a) true))
                         (and
                         (= (rec__test_constrained__r_acc__pointer_address a) 
                         (rec__test_constrained__r_acc__pointer_address b))
                         (= (rec__test_constrained__r_acc__pointer_value a) 
                         (rec__test_constrained__r_acc__pointer_value b)))))
                    true false))

(define-fun rec__test_constrained__r_acc__pointer_value__pred ((a us_rep1)) Bool 
  (not (= (rec__test_constrained__r_acc__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep1)

;; __null_pointer__def_axiom
  (assert
  (= (rec__test_constrained__r_acc__is_null_pointer us_null_pointer) true))

(declare-const dummy2 us_rep1)

(declare-datatypes ()
((r_acc__ref (r_acc__refqtmk (r_acc__content us_rep1)))))
(define-fun r_acc__ref_r_acc__content__projection ((a r_acc__ref)) us_rep1 
  (r_acc__content a))

(define-fun default_initial_assumption ((temp___expr_211 us_rep1)
  (temp___skip_top_level_212 Bool)) Bool (= (rec__test_constrained__r_acc__is_null_pointer
                                            temp___expr_211) true))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const test_constrained__r__b__first__bit1 Int)

(declare-const test_constrained__r__b__last__bit1 Int)

(declare-const test_constrained__r__b__position1 Int)

;; test_constrained__r__b__first__bit_axiom
  (assert (<= 0 test_constrained__r__b__first__bit1))

;; test_constrained__r__b__last__bit_axiom
  (assert
  (< test_constrained__r__b__first__bit1 test_constrained__r__b__last__bit1))

;; test_constrained__r__b__position_axiom
  (assert (<= 0 test_constrained__r__b__position1))

(declare-const test_constrained__r__x__first__bit1 Int)

(declare-const test_constrained__r__x__last__bit1 Int)

(declare-const test_constrained__r__x__position1 Int)

;; test_constrained__r__x__first__bit_axiom
  (assert (<= 0 test_constrained__r__x__first__bit1))

;; test_constrained__r__x__last__bit_axiom
  (assert
  (< test_constrained__r__x__first__bit1 test_constrained__r__x__last__bit1))

;; test_constrained__r__x__position_axiom
  (assert (<= 0 test_constrained__r__x__position1))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes () ((t15b__ref (t15b__refqtmk (t15b__content us_rep)))))
(define-fun t15b__ref_t15b__content__projection ((a t15b__ref)) us_rep 
  (t15b__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun default_initial_assumption1 ((temp___expr_182 us_rep)
  (temp___skip_top_level_183 Bool)) Bool (and
                                         (= (rec__test_constrained__r__b
                                            (us_split_discrs1
                                            temp___expr_182)) (distinct 1 0))
                                         (= (to_rep
                                            (rec__test_constrained__r__x
                                            (us_split_fields1
                                            temp___expr_182))) 0)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

(declare-const us_next_pointer_address Int)

(declare-const test_constrained__test_3__y__assume us_rep1)

;; H
  (assert
  (= (and (ite (and
               (not
               (= (rec__test_constrained__r_acc__is_null_pointer
                  test_constrained__test_3__y__assume) true))
               (= (rec__test_constrained__r_acc__pointer_address
                  test_constrained__test_3__y__assume) us_next_pointer_address))
          true false) (ite (= (rec__test_constrained__r_acc__pointer_value
                              test_constrained__test_3__y__assume) (us_repqtmk
                                                                   (us_split_discrsqtmk
                                                                   (distinct 0 0))
                                                                   (us_split_fieldsqtmk
                                                                   rliteral)))
                      true false)) true))

(declare-const y__pointer_value us_rep)

;; H
  (assert
  (= y__pointer_value (rec__test_constrained__r_acc__pointer_value
                      test_constrained__test_3__y__assume)))

(declare-const y__pointer_address Int)

;; H
  (assert
  (= y__pointer_address (rec__test_constrained__r_acc__pointer_address
                        test_constrained__test_3__y__assume)))

(declare-const y__is_null_pointer Bool)

;; H
  (assert
  (= y__is_null_pointer (rec__test_constrained__r_acc__is_null_pointer
                        test_constrained__test_3__y__assume)))

;; Assume
  (assert true)

(assert
;; defqtvc
 ;; File "test_constrained.adb", line 24, characters 0-0
  (not false))
(check-sat)

(exit)
