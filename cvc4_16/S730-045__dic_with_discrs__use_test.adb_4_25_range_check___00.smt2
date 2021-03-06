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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (positive positive) Bool)

(declare-const dummy positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun to_rep ((x positive)) Int (positiveqtint x))

(declare-fun of_rep (Int) positive)

;; inversion_axiom
  (assert
  (forall ((x positive))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x positive)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__test_2__context_type__first positive)(rec__test_2__context_type__last positive)))))
(define-fun us_split_discrs_rec__test_2__context_type__first__projection ((a us_split_discrs)) positive 
  (rec__test_2__context_type__first a))

(define-fun us_split_discrs_rec__test_2__context_type__last__projection ((a us_split_discrs)) positive 
  (rec__test_2__context_type__last a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__test_2__context_type__index positive)))))
(define-fun us_split_fields_rec__test_2__context_type__index__projection ((a us_split_fields)) positive 
  (rec__test_2__context_type__index a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep
                           (rec__test_2__context_type__first
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__test_2__context_type__first
                                                  (us_split_discrs1 b))))
                        (= (to_rep
                           (rec__test_2__context_type__last
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__test_2__context_type__last
                                                  (us_split_discrs1 b)))))
                        (= (to_rep
                           (rec__test_2__context_type__index
                           (us_split_fields1 a))) (to_rep
                                                  (rec__test_2__context_type__index
                                                  (us_split_fields1 b)))))
                   true false))

(define-fun in_range1 ((rec__test_2__context_type__first1 Int)
  (rec__test_2__context_type__last1 Int)
  (a us_split_discrs)) Bool (and
                            (= rec__test_2__context_type__first1 (to_rep
                                                                 (rec__test_2__context_type__first
                                                                 a)))
                            (= rec__test_2__context_type__last1 (to_rep
                                                                (rec__test_2__context_type__last
                                                                a)))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const test_2__context_type__first__first__bit Int)

(declare-const test_2__context_type__first__last__bit Int)

(declare-const test_2__context_type__first__position Int)

;; test_2__context_type__first__first__bit_axiom
  (assert (<= 0 test_2__context_type__first__first__bit))

;; test_2__context_type__first__last__bit_axiom
  (assert
  (< test_2__context_type__first__first__bit test_2__context_type__first__last__bit))

;; test_2__context_type__first__position_axiom
  (assert (<= 0 test_2__context_type__first__position))

(declare-const test_2__context_type__last__first__bit Int)

(declare-const test_2__context_type__last__last__bit Int)

(declare-const test_2__context_type__last__position Int)

;; test_2__context_type__last__first__bit_axiom
  (assert (<= 0 test_2__context_type__last__first__bit))

;; test_2__context_type__last__last__bit_axiom
  (assert
  (< test_2__context_type__last__first__bit test_2__context_type__last__last__bit))

;; test_2__context_type__last__position_axiom
  (assert (<= 0 test_2__context_type__last__position))

(declare-const test_2__context_type__index__first__bit Int)

(declare-const test_2__context_type__index__last__bit Int)

(declare-const test_2__context_type__index__position Int)

;; test_2__context_type__index__first__bit_axiom
  (assert (<= 0 test_2__context_type__index__first__bit))

;; test_2__context_type__index__last__bit_axiom
  (assert
  (< test_2__context_type__index__first__bit test_2__context_type__index__last__bit))

;; test_2__context_type__index__position_axiom
  (assert (<= 0 test_2__context_type__index__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((context_type__ref 0))
(((context_type__refqtmk (context_type__content us_rep)))))
(define-fun context_type__ref_context_type__content__projection ((a context_type__ref)) us_rep 
  (context_type__content a))

(declare-const x__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant ((temp___expr_180 us_rep)
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool)
  (temp___do_typ_inv_179 Bool)) Bool (=> (= temp___do_toplevel_178 true)
                                     (and
                                     (and
                                     (<= (to_rep
                                         (rec__test_2__context_type__first
                                         (us_split_discrs1 temp___expr_180))) 
                                     (to_rep
                                     (rec__test_2__context_type__last
                                     (us_split_discrs1 temp___expr_180))))
                                     (<= (to_rep
                                         (rec__test_2__context_type__first
                                         (us_split_discrs1 temp___expr_180))) 
                                     (to_rep
                                     (rec__test_2__context_type__index
                                     (us_split_fields1 temp___expr_180)))))
                                     (<= (to_rep
                                         (rec__test_2__context_type__index
                                         (us_split_fields1 temp___expr_180))) 
                                     (to_rep
                                     (rec__test_2__context_type__last
                                     (us_split_discrs1 temp___expr_180)))))))

(define-fun default_initial_assumption ((temp___expr_184 us_rep)
  (temp___skip_top_level_185 Bool)) Bool (and
                                         (and
                                         (and
                                         (= (to_rep
                                            (rec__test_2__context_type__first
                                            (us_split_discrs1
                                            temp___expr_184))) 1)
                                         (= (to_rep
                                            (rec__test_2__context_type__last
                                            (us_split_discrs1
                                            temp___expr_184))) 2147483647))
                                         (= (to_rep
                                            (rec__test_2__context_type__index
                                            (us_split_fields1
                                            temp___expr_184))) (to_rep
                                                               (rec__test_2__context_type__first
                                                               (us_split_discrs1
                                                               temp___expr_184)))))
                                         (=>
                                         (not
                                         (= temp___skip_top_level_185 true))
                                         (< (to_rep
                                            (rec__test_2__context_type__first
                                            (us_split_discrs1
                                            temp___expr_184))) (to_rep
                                                               (rec__test_2__context_type__last
                                                               (us_split_discrs1
                                                               temp___expr_184)))))))

(define-fun dynamic_predicate ((temp___189 us_rep)) Bool (and
                                                         (and
                                                         (<= (to_rep
                                                             (rec__test_2__context_type__first
                                                             (us_split_discrs1
                                                             temp___189))) 
                                                         (to_rep
                                                         (rec__test_2__context_type__last
                                                         (us_split_discrs1
                                                         temp___189))))
                                                         (<= (to_rep
                                                             (rec__test_2__context_type__first
                                                             (us_split_discrs1
                                                             temp___189))) 
                                                         (to_rep
                                                         (rec__test_2__context_type__index
                                                         (us_split_fields1
                                                         temp___189)))))
                                                         (<= (to_rep
                                                             (rec__test_2__context_type__index
                                                             (us_split_fields1
                                                             temp___189))) 
                                                         (to_rep
                                                         (rec__test_2__context_type__last
                                                         (us_split_discrs1
                                                         temp___189))))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const test_2__context_type__first__first__bit1 Int)

(declare-const test_2__context_type__first__last__bit1 Int)

(declare-const test_2__context_type__first__position1 Int)

;; test_2__context_type__first__first__bit_axiom
  (assert (<= 0 test_2__context_type__first__first__bit1))

;; test_2__context_type__first__last__bit_axiom
  (assert
  (< test_2__context_type__first__first__bit1 test_2__context_type__first__last__bit1))

;; test_2__context_type__first__position_axiom
  (assert (<= 0 test_2__context_type__first__position1))

(declare-const test_2__context_type__last__first__bit1 Int)

(declare-const test_2__context_type__last__last__bit1 Int)

(declare-const test_2__context_type__last__position1 Int)

;; test_2__context_type__last__first__bit_axiom
  (assert (<= 0 test_2__context_type__last__first__bit1))

;; test_2__context_type__last__last__bit_axiom
  (assert
  (< test_2__context_type__last__first__bit1 test_2__context_type__last__last__bit1))

;; test_2__context_type__last__position_axiom
  (assert (<= 0 test_2__context_type__last__position1))

(declare-const test_2__context_type__index__first__bit1 Int)

(declare-const test_2__context_type__index__last__bit1 Int)

(declare-const test_2__context_type__index__position1 Int)

;; test_2__context_type__index__first__bit_axiom
  (assert (<= 0 test_2__context_type__index__first__bit1))

;; test_2__context_type__index__last__bit_axiom
  (assert
  (< test_2__context_type__index__first__bit1 test_2__context_type__index__last__bit1))

;; test_2__context_type__index__position_axiom
  (assert (<= 0 test_2__context_type__index__position1))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((tyS__ref 0))
(((tyS__refqtmk (tyS__content us_rep)))))
(define-fun tyS__ref_tyS__content__projection ((a tyS__ref)) us_rep (tyS__content
                                                                    a))

(declare-const y__split_discrs us_split_discrs)

(declare-const y__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range
                                    temp___expr_46)))

(assert
;; defqtvc
 ;; File "use_test.adb", line 2, characters 0-0
  (not
  (forall ((x__split_fields positive) (x__split_discrs us_split_discrs))
  (=> (= x__attr__constrained false)
  (=> (default_initial_assumption
  (us_repqtmk x__split_discrs (us_split_fieldsqtmk x__split_fields)) false)
  (=> (dynamic_invariant
  (us_repqtmk x__split_discrs (us_split_fieldsqtmk x__split_fields)) false
  false true true) (in_range 1)))))))
(check-sat)
(exit)
