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

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

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

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun in_range2 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Bool)

(define-fun to_rep1 ((x natural)) Int (naturalqtint x))

(declare-fun of_rep1 (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort enum 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (enum enum) Bool)

(declare-const dummy2 enum)

(declare-datatypes ((enum__ref 0))
(((enum__refqtmk (enum__content enum)))))
(define-fun enum__ref_enum__content__projection ((a enum__ref)) enum 
  (enum__content a))

(declare-fun to_rep2 (enum) Int)

(declare-fun of_rep2 (Int) enum)

;; inversion_axiom
  (assert
  (forall ((x enum)) (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x enum)) (! (in_range3 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__basic__r__x enum)))))
(define-fun us_split_discrs_rec__basic__r__x__projection ((a us_split_discrs)) enum 
  (rec__basic__r__x a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__basic__r__base integer)(rec__basic__r__a_field integer)(rec__basic__r__c_field1 Bool)(rec__basic__r__c_field2 natural)))))
(define-fun us_split_fields_rec__basic__r__base__projection ((a us_split_fields)) integer 
  (rec__basic__r__base a))

(define-fun us_split_fields_rec__basic__r__a_field__projection ((a us_split_fields)) integer 
  (rec__basic__r__a_field a))

(define-fun us_split_fields_rec__basic__r__c_field1__projection ((a us_split_fields)) Bool 
  (rec__basic__r__c_field1 a))

(define-fun us_split_fields_rec__basic__r__c_field2__projection ((a us_split_fields)) natural 
  (rec__basic__r__c_field2 a))

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

(define-fun basic__r__a_field__pred ((a us_rep)) Bool (= (to_rep2
                                                         (rec__basic__r__x
                                                         (us_split_discrs1 a))) 0))

(define-fun basic__r__c_field1__pred ((a us_rep)) Bool (= (to_rep2
                                                          (rec__basic__r__x
                                                          (us_split_discrs1
                                                          a))) 2))

(define-fun basic__r__c_field2__pred ((a us_rep)) Bool (= (to_rep2
                                                          (rec__basic__r__x
                                                          (us_split_discrs1
                                                          a))) 2))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep2 (rec__basic__r__x (us_split_discrs1 a))) 
                        (to_rep2 (rec__basic__r__x (us_split_discrs1 b))))
                        (and
                        (and
                        (= (to_rep
                           (rec__basic__r__base (us_split_fields1 a))) 
                        (to_rep (rec__basic__r__base (us_split_fields1 b))))
                        (=> (basic__r__a_field__pred a)
                        (= (to_rep
                           (rec__basic__r__a_field (us_split_fields1 a))) 
                        (to_rep
                        (rec__basic__r__a_field (us_split_fields1 b))))))
                        (and
                        (=> (basic__r__c_field1__pred a)
                        (= (ite (rec__basic__r__c_field1
                                (us_split_fields1 a)) 1 0) (ite (rec__basic__r__c_field1
                                                                (us_split_fields1
                                                                b)) 1 0)))
                        (=> (basic__r__c_field2__pred a)
                        (= (to_rep1
                           (rec__basic__r__c_field2 (us_split_fields1 a))) 
                        (to_rep1
                        (rec__basic__r__c_field2 (us_split_fields1 b))))))))
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

(declare-const basic__r__x__first__bit Int)

(declare-const basic__r__x__last__bit Int)

(declare-const basic__r__x__position Int)

;; basic__r__x__first__bit_axiom
  (assert (<= 0 basic__r__x__first__bit))

;; basic__r__x__last__bit_axiom
  (assert (< basic__r__x__first__bit basic__r__x__last__bit))

;; basic__r__x__position_axiom
  (assert (<= 0 basic__r__x__position))

(declare-const basic__r__c_field1__first__bit Int)

(declare-const basic__r__c_field1__last__bit Int)

(declare-const basic__r__c_field1__position Int)

;; basic__r__c_field1__first__bit_axiom
  (assert (<= 0 basic__r__c_field1__first__bit))

;; basic__r__c_field1__last__bit_axiom
  (assert (< basic__r__c_field1__first__bit basic__r__c_field1__last__bit))

;; basic__r__c_field1__position_axiom
  (assert (<= 0 basic__r__c_field1__position))

(declare-const basic__r__c_field2__first__bit Int)

(declare-const basic__r__c_field2__last__bit Int)

(declare-const basic__r__c_field2__position Int)

;; basic__r__c_field2__first__bit_axiom
  (assert (<= 0 basic__r__c_field2__first__bit))

;; basic__r__c_field2__last__bit_axiom
  (assert (< basic__r__c_field2__first__bit basic__r__c_field2__last__bit))

;; basic__r__c_field2__position_axiom
  (assert (<= 0 basic__r__c_field2__position))

(declare-const basic__r__base__first__bit Int)

(declare-const basic__r__base__last__bit Int)

(declare-const basic__r__base__position Int)

;; basic__r__base__first__bit_axiom
  (assert (<= 0 basic__r__base__first__bit))

;; basic__r__base__last__bit_axiom
  (assert (< basic__r__base__first__bit basic__r__base__last__bit))

;; basic__r__base__position_axiom
  (assert (<= 0 basic__r__base__position))

(declare-const basic__r__a_field__first__bit Int)

(declare-const basic__r__a_field__last__bit Int)

(declare-const basic__r__a_field__position Int)

;; basic__r__a_field__first__bit_axiom
  (assert (<= 0 basic__r__a_field__first__bit))

;; basic__r__a_field__last__bit_axiom
  (assert (< basic__r__a_field__first__bit basic__r__a_field__last__bit))

;; basic__r__a_field__position_axiom
  (assert (<= 0 basic__r__a_field__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((s__ref 0))
(((s__refqtmk (s__content us_rep)))))
(define-fun s__ref_s__content__projection ((a s__ref)) us_rep (s__content a))

(declare-const v us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun in_range4 ((rec__basic__r__x1 Int)
  (a us_split_discrs)) Bool (= rec__basic__r__x1 (to_rep2
                                                 (rec__basic__r__x a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const basic__r__x__first__bit1 Int)

(declare-const basic__r__x__last__bit1 Int)

(declare-const basic__r__x__position1 Int)

;; basic__r__x__first__bit_axiom
  (assert (<= 0 basic__r__x__first__bit1))

;; basic__r__x__last__bit_axiom
  (assert (< basic__r__x__first__bit1 basic__r__x__last__bit1))

;; basic__r__x__position_axiom
  (assert (<= 0 basic__r__x__position1))

(declare-const basic__r__base__first__bit1 Int)

(declare-const basic__r__base__last__bit1 Int)

(declare-const basic__r__base__position1 Int)

;; basic__r__base__first__bit_axiom
  (assert (<= 0 basic__r__base__first__bit1))

;; basic__r__base__last__bit_axiom
  (assert (< basic__r__base__first__bit1 basic__r__base__last__bit1))

;; basic__r__base__position_axiom
  (assert (<= 0 basic__r__base__position1))

(declare-const basic__r__a_field__first__bit1 Int)

(declare-const basic__r__a_field__last__bit1 Int)

(declare-const basic__r__a_field__position1 Int)

;; basic__r__a_field__first__bit_axiom
  (assert (<= 0 basic__r__a_field__first__bit1))

;; basic__r__a_field__last__bit_axiom
  (assert (< basic__r__a_field__first__bit1 basic__r__a_field__last__bit1))

;; basic__r__a_field__position_axiom
  (assert (<= 0 basic__r__a_field__position1))

(declare-const basic__r__c_field1__first__bit1 Int)

(declare-const basic__r__c_field1__last__bit1 Int)

(declare-const basic__r__c_field1__position1 Int)

;; basic__r__c_field1__first__bit_axiom
  (assert (<= 0 basic__r__c_field1__first__bit1))

;; basic__r__c_field1__last__bit_axiom
  (assert (< basic__r__c_field1__first__bit1 basic__r__c_field1__last__bit1))

;; basic__r__c_field1__position_axiom
  (assert (<= 0 basic__r__c_field1__position1))

(declare-const basic__r__c_field2__first__bit1 Int)

(declare-const basic__r__c_field2__last__bit1 Int)

(declare-const basic__r__c_field2__position1 Int)

;; basic__r__c_field2__first__bit_axiom
  (assert (<= 0 basic__r__c_field2__first__bit1))

;; basic__r__c_field2__last__bit_axiom
  (assert (< basic__r__c_field2__first__bit1 basic__r__c_field2__last__bit1))

;; basic__r__c_field2__position_axiom
  (assert (<= 0 basic__r__c_field2__position1))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((r__ref 0))
(((r__refqtmk (r__content us_rep)))))
(define-fun r__ref_r__content__projection ((a r__ref)) us_rep (r__content a))

(declare-const z__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant ((temp___expr_171 us_rep)
  (temp___is_init_167 Bool) (temp___skip_constant_168 Bool)
  (temp___do_toplevel_169 Bool)
  (temp___do_typ_inv_170 Bool)) Bool (=>
                                     (not (= temp___skip_constant_168 true))
                                     (in_range4 0
                                     (us_split_discrs1 temp___expr_171))))

(define-fun default_initial_assumption ((temp___expr_173 us_rep)
  (temp___skip_top_level_174 Bool)) Bool (= (to_rep2
                                            (rec__basic__r__x
                                            (us_split_discrs1
                                            temp___expr_173))) 0))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const basic__r__x__first__bit2 Int)

(declare-const basic__r__x__last__bit2 Int)

(declare-const basic__r__x__position2 Int)

;; basic__r__x__first__bit_axiom
  (assert (<= 0 basic__r__x__first__bit2))

;; basic__r__x__last__bit_axiom
  (assert (< basic__r__x__first__bit2 basic__r__x__last__bit2))

;; basic__r__x__position_axiom
  (assert (<= 0 basic__r__x__position2))

(declare-const basic__r__c_field1__first__bit2 Int)

(declare-const basic__r__c_field1__last__bit2 Int)

(declare-const basic__r__c_field1__position2 Int)

;; basic__r__c_field1__first__bit_axiom
  (assert (<= 0 basic__r__c_field1__first__bit2))

;; basic__r__c_field1__last__bit_axiom
  (assert (< basic__r__c_field1__first__bit2 basic__r__c_field1__last__bit2))

;; basic__r__c_field1__position_axiom
  (assert (<= 0 basic__r__c_field1__position2))

(declare-const basic__r__c_field2__first__bit2 Int)

(declare-const basic__r__c_field2__last__bit2 Int)

(declare-const basic__r__c_field2__position2 Int)

;; basic__r__c_field2__first__bit_axiom
  (assert (<= 0 basic__r__c_field2__first__bit2))

;; basic__r__c_field2__last__bit_axiom
  (assert (< basic__r__c_field2__first__bit2 basic__r__c_field2__last__bit2))

;; basic__r__c_field2__position_axiom
  (assert (<= 0 basic__r__c_field2__position2))

(declare-const basic__r__base__first__bit2 Int)

(declare-const basic__r__base__last__bit2 Int)

(declare-const basic__r__base__position2 Int)

;; basic__r__base__first__bit_axiom
  (assert (<= 0 basic__r__base__first__bit2))

;; basic__r__base__last__bit_axiom
  (assert (< basic__r__base__first__bit2 basic__r__base__last__bit2))

;; basic__r__base__position_axiom
  (assert (<= 0 basic__r__base__position2))

(declare-const basic__r__a_field__first__bit2 Int)

(declare-const basic__r__a_field__last__bit2 Int)

(declare-const basic__r__a_field__position2 Int)

;; basic__r__a_field__first__bit_axiom
  (assert (<= 0 basic__r__a_field__first__bit2))

;; basic__r__a_field__last__bit_axiom
  (assert (< basic__r__a_field__first__bit2 basic__r__a_field__last__bit2))

;; basic__r__a_field__position_axiom
  (assert (<= 0 basic__r__a_field__position2))

(declare-fun user_eq5 (us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ((t1b__ref 0))
(((t1b__refqtmk (t1b__content us_rep)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) us_rep (t1b__content
                                                                    a))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun dynamic_invariant3 ((temp___expr_158 Int)
  (temp___is_init_154 Bool) (temp___skip_constant_155 Bool)
  (temp___do_toplevel_156 Bool)
  (temp___do_typ_inv_157 Bool)) Bool (=>
                                     (or (= temp___is_init_154 true)
                                     (<= 0 2)) (in_range3 temp___expr_158)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 1))

(assert
;; defqtvc
 ;; File "subty.ads", line 7, characters 0-0
  (not
  (forall ((o enum))
  (=> (dynamic_invariant v true false true true)
  (=> (= (to_rep2 o) 0)
  (let ((temp___182 (us_repqtmk (us_split_discrsqtmk o)
                    (us_split_fieldsqtmk rliteral rliteral true dummy1))))
  (forall ((z__split_fields us_split_fields))
  (=> (= z__split_fields (us_split_fields1 temp___182))
  (=> (= z__split_discrs (us_split_discrs1 temp___182))
  (=> (dynamic_invariant (us_repqtmk z__split_discrs z__split_fields) true
  false true true)
  (=> (= (to_rep2 (rec__basic__r__x z__split_discrs)) 0)
  (=> (= (to_rep (rec__basic__r__base z__split_fields)) 1)
  (=> (= (to_rep (rec__basic__r__a_field z__split_fields)) 1)
  (= (to_rep2 (rec__basic__r__x (us_split_discrs1 v))) 0))))))))))))))
(check-sat)
(exit)
