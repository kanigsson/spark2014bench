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

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
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
  (forall ((x positive)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-const c Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ()
((us_split_discrs (us_split_discrsqtmk (rec__test_dic__nested__t__x Bool)))))
(define-fun us_split_discrs_rec__test_dic__nested__t__x__projection ((a us_split_discrs)) Bool 
  (rec__test_dic__nested__t__x a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk (rec__test_dic__nested__t__f positive)))))
(define-fun us_split_fields_rec__test_dic__nested__t__f__projection ((a us_split_fields)) positive 
  (rec__test_dic__nested__t__f a))

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

(define-fun test_dic__nested__t__f__pred ((a us_rep)) Bool (= (ite (rec__test_dic__nested__t__x
                                                                   (us_split_discrs1
                                                                   a)) 1 0) 1))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__test_dic__nested__t__x
                                (us_split_discrs1 a)) 1 0) (ite (rec__test_dic__nested__t__x
                                                                (us_split_discrs1
                                                                b)) 1 0))
                        (=> (test_dic__nested__t__f__pred a)
                        (= (to_rep
                           (rec__test_dic__nested__t__f (us_split_fields1 a))) 
                        (to_rep
                        (rec__test_dic__nested__t__f (us_split_fields1 b))))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const test_dic__nested__t__x__first__bit Int)

(declare-const test_dic__nested__t__x__last__bit Int)

(declare-const test_dic__nested__t__x__position Int)

;; test_dic__nested__t__x__first__bit_axiom
  (assert (<= 0 test_dic__nested__t__x__first__bit))

;; test_dic__nested__t__x__last__bit_axiom
  (assert
  (< test_dic__nested__t__x__first__bit test_dic__nested__t__x__last__bit))

;; test_dic__nested__t__x__position_axiom
  (assert (<= 0 test_dic__nested__t__x__position))

(declare-const test_dic__nested__t__f__first__bit Int)

(declare-const test_dic__nested__t__f__last__bit Int)

(declare-const test_dic__nested__t__f__position Int)

;; test_dic__nested__t__f__first__bit_axiom
  (assert (<= 0 test_dic__nested__t__f__first__bit))

;; test_dic__nested__t__f__last__bit_axiom
  (assert
  (< test_dic__nested__t__f__first__bit test_dic__nested__t__f__last__bit))

;; test_dic__nested__t__f__position_axiom
  (assert (<= 0 test_dic__nested__t__f__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes () ((txS__ref (txS__refqtmk (txS__content us_rep)))))
(define-fun txS__ref_txS__content__projection ((a txS__ref)) us_rep (txS__content
                                                                    a))

(define-fun in_range3 ((rec__test_dic__nested__t__x1 Bool)
  (a us_split_discrs)) Bool (= rec__test_dic__nested__t__x1 (rec__test_dic__nested__t__x
                                                            a)))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const test_dic__nested__t__x__first__bit1 Int)

(declare-const test_dic__nested__t__x__last__bit1 Int)

(declare-const test_dic__nested__t__x__position1 Int)

;; test_dic__nested__t__x__first__bit_axiom
  (assert (<= 0 test_dic__nested__t__x__first__bit1))

;; test_dic__nested__t__x__last__bit_axiom
  (assert
  (< test_dic__nested__t__x__first__bit1 test_dic__nested__t__x__last__bit1))

;; test_dic__nested__t__x__position_axiom
  (assert (<= 0 test_dic__nested__t__x__position1))

(declare-const test_dic__nested__t__f__first__bit1 Int)

(declare-const test_dic__nested__t__f__last__bit1 Int)

(declare-const test_dic__nested__t__f__position1 Int)

;; test_dic__nested__t__f__first__bit_axiom
  (assert (<= 0 test_dic__nested__t__f__first__bit1))

;; test_dic__nested__t__f__last__bit_axiom
  (assert
  (< test_dic__nested__t__f__first__bit1 test_dic__nested__t__f__last__bit1))

;; test_dic__nested__t__f__position_axiom
  (assert (<= 0 test_dic__nested__t__f__position1))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes () ((t__ref (t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(declare-const x__split_discrs us_split_discrs)

(declare-const x__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun default_initial_assumption ((temp___expr_160 us_rep)
  (temp___skip_top_level_161 Bool)) Bool (and
                                         (and
                                         (= (rec__test_dic__nested__t__x
                                            (us_split_discrs1
                                            temp___expr_160)) (distinct 0 0))
                                         (=> (test_dic__nested__t__f__pred
                                         temp___expr_160)
                                         (= (to_rep
                                            (rec__test_dic__nested__t__f
                                            (us_split_fields1
                                            temp___expr_160))) c)))
                                         (=>
                                         (not
                                         (= temp___skip_top_level_161 true))
                                         (=>
                                         (= (rec__test_dic__nested__t__x
                                            (us_split_discrs1
                                            temp___expr_160)) true)
                                         (not (= c 0))))))

(declare-const y__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const test_dic__nested__t__x__first__bit2 Int)

(declare-const test_dic__nested__t__x__last__bit2 Int)

(declare-const test_dic__nested__t__x__position2 Int)

;; test_dic__nested__t__x__first__bit_axiom
  (assert (<= 0 test_dic__nested__t__x__first__bit2))

;; test_dic__nested__t__x__last__bit_axiom
  (assert
  (< test_dic__nested__t__x__first__bit2 test_dic__nested__t__x__last__bit2))

;; test_dic__nested__t__x__position_axiom
  (assert (<= 0 test_dic__nested__t__x__position2))

(declare-const test_dic__nested__t__f__first__bit2 Int)

(declare-const test_dic__nested__t__f__last__bit2 Int)

(declare-const test_dic__nested__t__f__position2 Int)

;; test_dic__nested__t__f__first__bit_axiom
  (assert (<= 0 test_dic__nested__t__f__first__bit2))

;; test_dic__nested__t__f__last__bit_axiom
  (assert
  (< test_dic__nested__t__f__first__bit2 test_dic__nested__t__f__last__bit2))

;; test_dic__nested__t__f__position_axiom
  (assert (<= 0 test_dic__nested__t__f__position2))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes () ((tzS__ref (tzS__refqtmk (tzS__content us_rep)))))
(define-fun tzS__ref_tzS__content__projection ((a tzS__ref)) us_rep (tzS__content
                                                                    a))

(declare-const z__split_discrs us_split_discrs)

(declare-const z__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(declare-const x__split_fields positive)

(declare-const y__split_fields positive)

(declare-const y__split_discrs Bool)

;; Assume
  (assert (dynamic_invariant c true false true true))

;; Assume
  (assert (= x__attr__constrained true))

;; Assume
  (assert
  (and
  (and (= (rec__test_dic__nested__t__x x__split_discrs) (distinct 0 0))
  (=> (test_dic__nested__t__f__pred
  (us_repqtmk x__split_discrs (us_split_fieldsqtmk x__split_fields)))
  (= (to_rep x__split_fields) c)))
  (=> (= (rec__test_dic__nested__t__x x__split_discrs) true) (not (= c 0)))))

;; Assume
  (assert (in_range3 (distinct 0 0)
  (us_split_discrs1
  (us_repqtmk x__split_discrs (us_split_fieldsqtmk x__split_fields)))))

(declare-const usf us_rep)

;; Ensures
  (assert
  (= (distinct 0 0) (rec__test_dic__nested__t__x (us_split_discrs1 usf))))

;; H
  (assert (= (rec__test_dic__nested__t__x (us_split_discrs1 usf)) true))

(assert
;; defqtvc
 ;; File "test_dic.adb", line 1, characters 0-0
  (not (not (= c 0))))
(check-sat)
