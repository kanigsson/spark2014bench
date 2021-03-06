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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun in_range1 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__foo__level_0__a1 Bool)(rec__foo__level_0__a2 Bool)(rec__foo__level_0__a3 Bool)(rec__foo__level_0__a4 Bool)(rec__foo__level_0__a5 Bool)))))
(define-fun us_split_fields_rec__foo__level_0__a1__projection ((a us_split_fields)) Bool 
  (rec__foo__level_0__a1 a))

(define-fun us_split_fields_rec__foo__level_0__a2__projection ((a us_split_fields)) Bool 
  (rec__foo__level_0__a2 a))

(define-fun us_split_fields_rec__foo__level_0__a3__projection ((a us_split_fields)) Bool 
  (rec__foo__level_0__a3 a))

(define-fun us_split_fields_rec__foo__level_0__a4__projection ((a us_split_fields)) Bool 
  (rec__foo__level_0__a4 a))

(define-fun us_split_fields_rec__foo__level_0__a5__projection ((a us_split_fields)) Bool 
  (rec__foo__level_0__a5 a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (ite (rec__foo__level_0__a1 (us_split_fields1 a)) 1 0) (ite 
                        (rec__foo__level_0__a1 (us_split_fields1 b)) 1 0))
                        (= (ite (rec__foo__level_0__a2 (us_split_fields1 a)) 1 0) (ite 
                        (rec__foo__level_0__a2 (us_split_fields1 b)) 1 0)))
                        (and
                        (and
                        (= (ite (rec__foo__level_0__a3 (us_split_fields1 a)) 1 0) (ite 
                        (rec__foo__level_0__a3 (us_split_fields1 b)) 1 0))
                        (= (ite (rec__foo__level_0__a4 (us_split_fields1 a)) 1 0) (ite 
                        (rec__foo__level_0__a4 (us_split_fields1 b)) 1 0)))
                        (= (ite (rec__foo__level_0__a5 (us_split_fields1 a)) 1 0) (ite 
                        (rec__foo__level_0__a5 (us_split_fields1 b)) 1 0))))
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

(declare-const foo__level_0__a1__first__bit Int)

(declare-const foo__level_0__a1__last__bit Int)

(declare-const foo__level_0__a1__position Int)

;; foo__level_0__a1__first__bit_axiom
  (assert (<= 0 foo__level_0__a1__first__bit))

;; foo__level_0__a1__last__bit_axiom
  (assert (< foo__level_0__a1__first__bit foo__level_0__a1__last__bit))

;; foo__level_0__a1__position_axiom
  (assert (<= 0 foo__level_0__a1__position))

(declare-const foo__level_0__a2__first__bit Int)

(declare-const foo__level_0__a2__last__bit Int)

(declare-const foo__level_0__a2__position Int)

;; foo__level_0__a2__first__bit_axiom
  (assert (<= 0 foo__level_0__a2__first__bit))

;; foo__level_0__a2__last__bit_axiom
  (assert (< foo__level_0__a2__first__bit foo__level_0__a2__last__bit))

;; foo__level_0__a2__position_axiom
  (assert (<= 0 foo__level_0__a2__position))

(declare-const foo__level_0__a3__first__bit Int)

(declare-const foo__level_0__a3__last__bit Int)

(declare-const foo__level_0__a3__position Int)

;; foo__level_0__a3__first__bit_axiom
  (assert (<= 0 foo__level_0__a3__first__bit))

;; foo__level_0__a3__last__bit_axiom
  (assert (< foo__level_0__a3__first__bit foo__level_0__a3__last__bit))

;; foo__level_0__a3__position_axiom
  (assert (<= 0 foo__level_0__a3__position))

(declare-const foo__level_0__a4__first__bit Int)

(declare-const foo__level_0__a4__last__bit Int)

(declare-const foo__level_0__a4__position Int)

;; foo__level_0__a4__first__bit_axiom
  (assert (<= 0 foo__level_0__a4__first__bit))

;; foo__level_0__a4__last__bit_axiom
  (assert (< foo__level_0__a4__first__bit foo__level_0__a4__last__bit))

;; foo__level_0__a4__position_axiom
  (assert (<= 0 foo__level_0__a4__position))

(declare-const foo__level_0__a5__first__bit Int)

(declare-const foo__level_0__a5__last__bit Int)

(declare-const foo__level_0__a5__position Int)

;; foo__level_0__a5__first__bit_axiom
  (assert (<= 0 foo__level_0__a5__first__bit))

;; foo__level_0__a5__last__bit_axiom
  (assert (< foo__level_0__a5__first__bit foo__level_0__a5__last__bit))

;; foo__level_0__a5__position_axiom
  (assert (<= 0 foo__level_0__a5__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((level_0__ref 0))
(((level_0__refqtmk (level_0__content us_rep)))))
(define-fun level_0__ref_level_0__content__projection ((a level_0__ref)) us_rep 
  (level_0__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__foo__level_1__b1 us_rep)(rec__foo__level_1__b2 us_rep)(rec__foo__level_1__b3 us_rep)(rec__foo__level_1__b4 us_rep)))))
(define-fun us_split_fields_rec__foo__level_1__b1__projection ((a us_split_fields2)) us_rep 
  (rec__foo__level_1__b1 a))

(define-fun us_split_fields_rec__foo__level_1__b2__projection ((a us_split_fields2)) us_rep 
  (rec__foo__level_1__b2 a))

(define-fun us_split_fields_rec__foo__level_1__b3__projection ((a us_split_fields2)) us_rep 
  (rec__foo__level_1__b3 a))

(define-fun us_split_fields_rec__foo__level_1__b4__projection ((a us_split_fields2)) us_rep 
  (rec__foo__level_1__b4 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (and
                         (= (bool_eq
                            (rec__foo__level_1__b1 (us_split_fields3 a))
                            (rec__foo__level_1__b1 (us_split_fields3 b))) true)
                         (= (bool_eq
                            (rec__foo__level_1__b2 (us_split_fields3 a))
                            (rec__foo__level_1__b2 (us_split_fields3 b))) true))
                         (and
                         (= (bool_eq
                            (rec__foo__level_1__b3 (us_split_fields3 a))
                            (rec__foo__level_1__b3 (us_split_fields3 b))) true)
                         (= (bool_eq
                            (rec__foo__level_1__b4 (us_split_fields3 a))
                            (rec__foo__level_1__b4 (us_split_fields3 b))) true)))
                    true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const foo__level_1__b1__first__bit Int)

(declare-const foo__level_1__b1__last__bit Int)

(declare-const foo__level_1__b1__position Int)

;; foo__level_1__b1__first__bit_axiom
  (assert (<= 0 foo__level_1__b1__first__bit))

;; foo__level_1__b1__last__bit_axiom
  (assert (< foo__level_1__b1__first__bit foo__level_1__b1__last__bit))

;; foo__level_1__b1__position_axiom
  (assert (<= 0 foo__level_1__b1__position))

(declare-const foo__level_1__b2__first__bit Int)

(declare-const foo__level_1__b2__last__bit Int)

(declare-const foo__level_1__b2__position Int)

;; foo__level_1__b2__first__bit_axiom
  (assert (<= 0 foo__level_1__b2__first__bit))

;; foo__level_1__b2__last__bit_axiom
  (assert (< foo__level_1__b2__first__bit foo__level_1__b2__last__bit))

;; foo__level_1__b2__position_axiom
  (assert (<= 0 foo__level_1__b2__position))

(declare-const foo__level_1__b3__first__bit Int)

(declare-const foo__level_1__b3__last__bit Int)

(declare-const foo__level_1__b3__position Int)

;; foo__level_1__b3__first__bit_axiom
  (assert (<= 0 foo__level_1__b3__first__bit))

;; foo__level_1__b3__last__bit_axiom
  (assert (< foo__level_1__b3__first__bit foo__level_1__b3__last__bit))

;; foo__level_1__b3__position_axiom
  (assert (<= 0 foo__level_1__b3__position))

(declare-const foo__level_1__b4__first__bit Int)

(declare-const foo__level_1__b4__last__bit Int)

(declare-const foo__level_1__b4__position Int)

;; foo__level_1__b4__first__bit_axiom
  (assert (<= 0 foo__level_1__b4__first__bit))

;; foo__level_1__b4__last__bit_axiom
  (assert (< foo__level_1__b4__first__bit foo__level_1__b4__last__bit))

;; foo__level_1__b4__position_axiom
  (assert (<= 0 foo__level_1__b4__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((level_1__ref 0))
(((level_1__refqtmk (level_1__content us_rep1)))))
(define-fun level_1__ref_level_1__content__projection ((a level_1__ref)) us_rep1 
  (level_1__content a))

(declare-datatypes ((us_split_fields4 0))
(((us_split_fieldsqtmk2
  (rec__foo__level_2__c1 us_rep1)(rec__foo__level_2__c2 us_rep1)(rec__foo__level_2__c3 us_rep1)))))
(define-fun us_split_fields_rec__foo__level_2__c1__projection ((a us_split_fields4)) us_rep1 
  (rec__foo__level_2__c1 a))

(define-fun us_split_fields_rec__foo__level_2__c2__projection ((a us_split_fields4)) us_rep1 
  (rec__foo__level_2__c2 a))

(define-fun us_split_fields_rec__foo__level_2__c3__projection ((a us_split_fields4)) us_rep1 
  (rec__foo__level_2__c3 a))

(declare-datatypes ((us_split_fields__ref2 0))
(((us_split_fields__refqtmk2 (us_split_fields__content2 us_split_fields4)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref2)) us_split_fields4 
  (us_split_fields__content2 a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2 (us_split_fields5 us_split_fields4)))))
(define-fun us_rep___split_fields__3__projection ((a us_rep2)) us_split_fields4 
  (us_split_fields5 a))

(define-fun bool_eq2 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (and
                         (= (bool_eq1
                            (rec__foo__level_2__c1 (us_split_fields5 a))
                            (rec__foo__level_2__c1 (us_split_fields5 b))) true)
                         (= (bool_eq1
                            (rec__foo__level_2__c2 (us_split_fields5 a))
                            (rec__foo__level_2__c2 (us_split_fields5 b))) true))
                         (= (bool_eq1
                            (rec__foo__level_2__c3 (us_split_fields5 a))
                            (rec__foo__level_2__c3 (us_split_fields5 b))) true))
                    true false))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const foo__level_2__c1__first__bit Int)

(declare-const foo__level_2__c1__last__bit Int)

(declare-const foo__level_2__c1__position Int)

;; foo__level_2__c1__first__bit_axiom
  (assert (<= 0 foo__level_2__c1__first__bit))

;; foo__level_2__c1__last__bit_axiom
  (assert (< foo__level_2__c1__first__bit foo__level_2__c1__last__bit))

;; foo__level_2__c1__position_axiom
  (assert (<= 0 foo__level_2__c1__position))

(declare-const foo__level_2__c2__first__bit Int)

(declare-const foo__level_2__c2__last__bit Int)

(declare-const foo__level_2__c2__position Int)

;; foo__level_2__c2__first__bit_axiom
  (assert (<= 0 foo__level_2__c2__first__bit))

;; foo__level_2__c2__last__bit_axiom
  (assert (< foo__level_2__c2__first__bit foo__level_2__c2__last__bit))

;; foo__level_2__c2__position_axiom
  (assert (<= 0 foo__level_2__c2__position))

(declare-const foo__level_2__c3__first__bit Int)

(declare-const foo__level_2__c3__last__bit Int)

(declare-const foo__level_2__c3__position Int)

;; foo__level_2__c3__first__bit_axiom
  (assert (<= 0 foo__level_2__c3__first__bit))

;; foo__level_2__c3__last__bit_axiom
  (assert (< foo__level_2__c3__first__bit foo__level_2__c3__last__bit))

;; foo__level_2__c3__position_axiom
  (assert (<= 0 foo__level_2__c3__position))

(declare-fun user_eq3 (us_rep2 us_rep2) Bool)

(declare-const dummy3 us_rep2)

(declare-datatypes ((level_2__ref 0))
(((level_2__refqtmk (level_2__content us_rep2)))))
(define-fun level_2__ref_level_2__content__projection ((a level_2__ref)) us_rep2 
  (level_2__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun invariant__ (us_rep1 us_rep1 us_rep1) Bool)

(declare-fun invariant____function_guard (Bool us_rep1 us_rep1 us_rep1) Bool)

;; invariant____post_axiom
  (assert true)

;; invariant____def_axiom
  (assert
  (forall ((a us_rep1) (b us_rep1) (c us_rep1))
  (! (= (= (invariant__ a b c) true)
     (and
     (and
     (= (rec__foo__level_0__a1
        (us_split_fields1 (rec__foo__level_1__b1 (us_split_fields3 a)))) true)
     (= (rec__foo__level_0__a2
        (us_split_fields1 (rec__foo__level_1__b2 (us_split_fields3 b)))) true))
     (= (rec__foo__level_0__a3
        (us_split_fields1 (rec__foo__level_1__b3 (us_split_fields3 c)))) true))) :pattern (
  (invariant__ a b c)) )))

(assert
;; defqtvc
 ;; File "foo.ads", line 27, characters 0-0
  (not
  (forall ((red__split_fields us_split_fields4)
  (black__split_fields us_split_fields4))
  (=> (dynamic_invariant x true false true true)
  (=> (< 1 x)
  (=>
  (forall ((red__split_fields1 us_split_fields4))
  (invariant____function_guard
  (invariant__ (rec__foo__level_2__c1 red__split_fields1)
  (rec__foo__level_2__c2 red__split_fields1)
  (rec__foo__level_2__c3 red__split_fields1))
  (rec__foo__level_2__c1 red__split_fields1)
  (rec__foo__level_2__c2 red__split_fields1)
  (rec__foo__level_2__c3 red__split_fields1)))
  (=>
  (= (invariant__ (rec__foo__level_2__c1 red__split_fields)
     (rec__foo__level_2__c2 red__split_fields)
     (rec__foo__level_2__c3 red__split_fields)) true)
  (=>
  (forall ((black__split_fields1 us_split_fields4))
  (invariant____function_guard
  (invariant__ (rec__foo__level_2__c1 black__split_fields1)
  (rec__foo__level_2__c2 black__split_fields1)
  (rec__foo__level_2__c3 black__split_fields1))
  (rec__foo__level_2__c1 black__split_fields1)
  (rec__foo__level_2__c2 black__split_fields1)
  (rec__foo__level_2__c3 black__split_fields1)))
  (=>
  (= (invariant__ (rec__foo__level_2__c1 black__split_fields)
     (rec__foo__level_2__c2 black__split_fields)
     (rec__foo__level_2__c3 black__split_fields)) true)
  (=>
  (forall ((red__split_fields1 us_split_fields4))
  (invariant____function_guard
  (invariant__ (rec__foo__level_2__c1 red__split_fields1)
  (rec__foo__level_2__c2 red__split_fields1)
  (rec__foo__level_2__c3 red__split_fields1))
  (rec__foo__level_2__c1 red__split_fields1)
  (rec__foo__level_2__c2 red__split_fields1)
  (rec__foo__level_2__c3 red__split_fields1)))
  (= (invariant__ (rec__foo__level_2__c1 red__split_fields)
     (rec__foo__level_2__c2 red__split_fields)
     (rec__foo__level_2__c3 red__split_fields)) true)))))))))))
(check-sat)
(exit)
