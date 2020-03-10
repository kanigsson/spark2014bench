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

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

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

(declare-const discr Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const init_val Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__extended_returns__record_t__discr natural)))))
(define-fun us_split_discrs_rec__extended_returns__record_t__discr__projection ((a us_split_discrs)) natural 
  (rec__extended_returns__record_t__discr a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__extended_returns__record_t__a integer)(rec__extended_returns__record_t__b integer)(rec__extended_returns__record_t__c integer)(rec__extended_returns__record_t__d integer)))))
(define-fun us_split_fields_rec__extended_returns__record_t__a__projection ((a us_split_fields)) integer 
  (rec__extended_returns__record_t__a a))

(define-fun us_split_fields_rec__extended_returns__record_t__b__projection ((a us_split_fields)) integer 
  (rec__extended_returns__record_t__b a))

(define-fun us_split_fields_rec__extended_returns__record_t__c__projection ((a us_split_fields)) integer 
  (rec__extended_returns__record_t__c a))

(define-fun us_split_fields_rec__extended_returns__record_t__d__projection ((a us_split_fields)) integer 
  (rec__extended_returns__record_t__d a))

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

(define-fun extended_returns__record_t__b__pred ((a us_rep)) Bool (= 
  (to_rep1 (rec__extended_returns__record_t__discr (us_split_discrs1 a))) 0))

(define-fun extended_returns__record_t__c__pred ((a us_rep)) Bool (= 
  (to_rep1 (rec__extended_returns__record_t__discr (us_split_discrs1 a))) 1))

(define-fun extended_returns__record_t__d__pred ((a us_rep)) Bool (= 
  (to_rep1 (rec__extended_returns__record_t__discr (us_split_discrs1 a))) 1))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep1
                           (rec__extended_returns__record_t__discr
                           (us_split_discrs1 a))) (to_rep1
                                                  (rec__extended_returns__record_t__discr
                                                  (us_split_discrs1 b))))
                        (and
                        (and
                        (= (to_rep
                           (rec__extended_returns__record_t__a
                           (us_split_fields1 a))) (to_rep
                                                  (rec__extended_returns__record_t__a
                                                  (us_split_fields1 b))))
                        (=> (extended_returns__record_t__b__pred a)
                        (= (to_rep
                           (rec__extended_returns__record_t__b
                           (us_split_fields1 a))) (to_rep
                                                  (rec__extended_returns__record_t__b
                                                  (us_split_fields1 b))))))
                        (and
                        (=> (extended_returns__record_t__c__pred a)
                        (= (to_rep
                           (rec__extended_returns__record_t__c
                           (us_split_fields1 a))) (to_rep
                                                  (rec__extended_returns__record_t__c
                                                  (us_split_fields1 b)))))
                        (=> (extended_returns__record_t__d__pred a)
                        (= (to_rep
                           (rec__extended_returns__record_t__d
                           (us_split_fields1 a))) (to_rep
                                                  (rec__extended_returns__record_t__d
                                                  (us_split_fields1 b))))))))
                   true false))

(define-fun in_range2 ((rec__extended_returns__record_t__discr1 Int)
  (a us_split_discrs)) Bool (= rec__extended_returns__record_t__discr1 
  (to_rep1 (rec__extended_returns__record_t__discr a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const extended_returns__record_t__discr__first__bit Int)

(declare-const extended_returns__record_t__discr__last__bit Int)

(declare-const extended_returns__record_t__discr__position Int)

;; extended_returns__record_t__discr__first__bit_axiom
  (assert (<= 0 extended_returns__record_t__discr__first__bit))

;; extended_returns__record_t__discr__last__bit_axiom
  (assert
  (< extended_returns__record_t__discr__first__bit extended_returns__record_t__discr__last__bit))

;; extended_returns__record_t__discr__position_axiom
  (assert (<= 0 extended_returns__record_t__discr__position))

(declare-const extended_returns__record_t__a__first__bit Int)

(declare-const extended_returns__record_t__a__last__bit Int)

(declare-const extended_returns__record_t__a__position Int)

;; extended_returns__record_t__a__first__bit_axiom
  (assert (<= 0 extended_returns__record_t__a__first__bit))

;; extended_returns__record_t__a__last__bit_axiom
  (assert
  (< extended_returns__record_t__a__first__bit extended_returns__record_t__a__last__bit))

;; extended_returns__record_t__a__position_axiom
  (assert (<= 0 extended_returns__record_t__a__position))

(declare-const extended_returns__record_t__b__first__bit Int)

(declare-const extended_returns__record_t__b__last__bit Int)

(declare-const extended_returns__record_t__b__position Int)

;; extended_returns__record_t__b__first__bit_axiom
  (assert (<= 0 extended_returns__record_t__b__first__bit))

;; extended_returns__record_t__b__last__bit_axiom
  (assert
  (< extended_returns__record_t__b__first__bit extended_returns__record_t__b__last__bit))

;; extended_returns__record_t__b__position_axiom
  (assert (<= 0 extended_returns__record_t__b__position))

(declare-const extended_returns__record_t__c__first__bit Int)

(declare-const extended_returns__record_t__c__last__bit Int)

(declare-const extended_returns__record_t__c__position Int)

;; extended_returns__record_t__c__first__bit_axiom
  (assert (<= 0 extended_returns__record_t__c__first__bit))

;; extended_returns__record_t__c__last__bit_axiom
  (assert
  (< extended_returns__record_t__c__first__bit extended_returns__record_t__c__last__bit))

;; extended_returns__record_t__c__position_axiom
  (assert (<= 0 extended_returns__record_t__c__position))

(declare-const extended_returns__record_t__d__first__bit Int)

(declare-const extended_returns__record_t__d__last__bit Int)

(declare-const extended_returns__record_t__d__position Int)

;; extended_returns__record_t__d__first__bit_axiom
  (assert (<= 0 extended_returns__record_t__d__first__bit))

;; extended_returns__record_t__d__last__bit_axiom
  (assert
  (< extended_returns__record_t__d__first__bit extended_returns__record_t__d__last__bit))

;; extended_returns__record_t__d__position_axiom
  (assert (<= 0 extended_returns__record_t__d__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((record_t__ref 0))
(((record_t__refqtmk (record_t__content us_rep)))))
(define-fun record_t__ref_record_t__content__projection ((a record_t__ref)) us_rep 
  (record_t__content a))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const extended_returns__record_t__discr__first__bit1 Int)

(declare-const extended_returns__record_t__discr__last__bit1 Int)

(declare-const extended_returns__record_t__discr__position1 Int)

;; extended_returns__record_t__discr__first__bit_axiom
  (assert (<= 0 extended_returns__record_t__discr__first__bit1))

;; extended_returns__record_t__discr__last__bit_axiom
  (assert
  (< extended_returns__record_t__discr__first__bit1 extended_returns__record_t__discr__last__bit1))

;; extended_returns__record_t__discr__position_axiom
  (assert (<= 0 extended_returns__record_t__discr__position1))

(declare-const extended_returns__record_t__a__first__bit1 Int)

(declare-const extended_returns__record_t__a__last__bit1 Int)

(declare-const extended_returns__record_t__a__position1 Int)

;; extended_returns__record_t__a__first__bit_axiom
  (assert (<= 0 extended_returns__record_t__a__first__bit1))

;; extended_returns__record_t__a__last__bit_axiom
  (assert
  (< extended_returns__record_t__a__first__bit1 extended_returns__record_t__a__last__bit1))

;; extended_returns__record_t__a__position_axiom
  (assert (<= 0 extended_returns__record_t__a__position1))

(declare-const extended_returns__record_t__b__first__bit1 Int)

(declare-const extended_returns__record_t__b__last__bit1 Int)

(declare-const extended_returns__record_t__b__position1 Int)

;; extended_returns__record_t__b__first__bit_axiom
  (assert (<= 0 extended_returns__record_t__b__first__bit1))

;; extended_returns__record_t__b__last__bit_axiom
  (assert
  (< extended_returns__record_t__b__first__bit1 extended_returns__record_t__b__last__bit1))

;; extended_returns__record_t__b__position_axiom
  (assert (<= 0 extended_returns__record_t__b__position1))

(declare-const extended_returns__record_t__c__first__bit1 Int)

(declare-const extended_returns__record_t__c__last__bit1 Int)

(declare-const extended_returns__record_t__c__position1 Int)

;; extended_returns__record_t__c__first__bit_axiom
  (assert (<= 0 extended_returns__record_t__c__first__bit1))

;; extended_returns__record_t__c__last__bit_axiom
  (assert
  (< extended_returns__record_t__c__first__bit1 extended_returns__record_t__c__last__bit1))

;; extended_returns__record_t__c__position_axiom
  (assert (<= 0 extended_returns__record_t__c__position1))

(declare-const extended_returns__record_t__d__first__bit1 Int)

(declare-const extended_returns__record_t__d__last__bit1 Int)

(declare-const extended_returns__record_t__d__position1 Int)

;; extended_returns__record_t__d__first__bit_axiom
  (assert (<= 0 extended_returns__record_t__d__first__bit1))

;; extended_returns__record_t__d__last__bit_axiom
  (assert
  (< extended_returns__record_t__d__first__bit1 extended_returns__record_t__d__last__bit1))

;; extended_returns__record_t__d__position_axiom
  (assert (<= 0 extended_returns__record_t__d__position1))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((tresultS__ref 0))
(((tresultS__refqtmk (tresultS__content us_rep)))))
(define-fun tresultS__ref_tresultS__content__projection ((a tresultS__ref)) us_rep 
  (tresultS__content a))

(declare-const result____split_discrs us_split_discrs)

(declare-const result____attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant2 ((temp___expr_174 us_rep)
  (temp___is_init_170 Bool) (temp___skip_constant_171 Bool)
  (temp___do_toplevel_172 Bool)
  (temp___do_typ_inv_173 Bool)) Bool (=>
                                     (not (= temp___skip_constant_171 true))
                                     (in_range2 discr
                                     (us_split_discrs1 temp___expr_174))))

(define-fun default_initial_assumption ((temp___expr_176 us_rep)
  (temp___skip_top_level_177 Bool)) Bool (= (to_rep1
                                            (rec__extended_returns__record_t__discr
                                            (us_split_discrs1
                                            temp___expr_176))) discr))

(define-fun default_initial_assumption1 ((temp___expr_161 us_rep)
  (temp___skip_top_level_162 Bool)) Bool (= (to_rep1
                                            (rec__extended_returns__record_t__discr
                                            (us_split_discrs1
                                            temp___expr_161))) 0))

(assert
;; defqtvc
 ;; File "extended_returns.ads", line 15, characters 0-0
  (not
  (forall ((result____split_fields us_split_fields))
  (=> (dynamic_invariant discr true false true true)
  (=> (dynamic_invariant1 init_val true false true true)
  (=> (in_range1 discr)
  (=> (= result____attr__constrained true)
  (=> (default_initial_assumption
  (us_repqtmk result____split_discrs result____split_fields) false)
  (=> (dynamic_invariant2
  (us_repqtmk result____split_discrs result____split_fields) false false true
  true)
  (forall ((o integer))
  (=> (= (to_rep o) init_val)
  (forall ((result____split_fields1 us_split_fields))
  (=>
  (= result____split_fields1 (us_split_fieldsqtmk o
                             (rec__extended_returns__record_t__b
                             result____split_fields)
                             (rec__extended_returns__record_t__c
                             result____split_fields)
                             (rec__extended_returns__record_t__d
                             result____split_fields)))
  (forall ((result____split_fields2 us_split_fields))
  (=>
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (= discr 0) true false))
  (ite (= spark__branch true)
  (exists ((o1 integer))
  (and (= (to_rep o1) init_val)
  (= result____split_fields2 (us_split_fieldsqtmk
                             (rec__extended_returns__record_t__a
                             result____split_fields1) o1
                             (rec__extended_returns__record_t__c
                             result____split_fields1)
                             (rec__extended_returns__record_t__d
                             result____split_fields1)))))
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 (ite (= discr 1) true false))
  (ite (= spark__branch1 true)
  (exists ((o1 integer))
  (and (= (to_rep o1) init_val)
  (exists ((result____split_fields3 us_split_fields))
  (and
  (= result____split_fields3 (us_split_fieldsqtmk
                             (rec__extended_returns__record_t__a
                             result____split_fields1)
                             (rec__extended_returns__record_t__b
                             result____split_fields1) o1
                             (rec__extended_returns__record_t__d
                             result____split_fields1)))
  (exists ((o2 integer))
  (and (= (to_rep o2) init_val)
  (= result____split_fields2 (us_split_fieldsqtmk
                             (rec__extended_returns__record_t__a
                             result____split_fields3)
                             (rec__extended_returns__record_t__b
                             result____split_fields3)
                             (rec__extended_returns__record_t__c
                             result____split_fields3) o2))))))))
  (= result____split_fields2 result____split_fields1)))))))
  (forall ((extended_returns__init__result us_rep))
  (=>
  (= extended_returns__init__result (us_repqtmk result____split_discrs
                                    result____split_fields2))
  (= (to_rep
     (rec__extended_returns__record_t__a
     (us_split_fields1 extended_returns__init__result))) init_val))))))))))))))))))
(check-sat)
(exit)
