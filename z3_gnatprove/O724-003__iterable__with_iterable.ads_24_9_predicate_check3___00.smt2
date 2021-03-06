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

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

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

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk (rec__with_iterable__cursor__c natural)))))
(define-fun us_split_discrs_rec__with_iterable__cursor__c__projection ((a us_split_discrs)) natural 
  (rec__with_iterable__cursor__c a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk (rec__with_iterable__cursor__i natural)))))
(define-fun us_split_fields_rec__with_iterable__cursor__i__projection ((a us_split_fields)) natural 
  (rec__with_iterable__cursor__i a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__with_iterable__cursor__c
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__with_iterable__cursor__c
                                                  (us_split_discrs1 b))))
                        (= (to_rep
                           (rec__with_iterable__cursor__i
                           (us_split_fields1 a))) (to_rep
                                                  (rec__with_iterable__cursor__i
                                                  (us_split_fields1 b)))))
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

(declare-const with_iterable__cursor__c__first__bit Int)

(declare-const with_iterable__cursor__c__last__bit Int)

(declare-const with_iterable__cursor__c__position Int)

;; with_iterable__cursor__c__first__bit_axiom
  (assert (<= 0 with_iterable__cursor__c__first__bit))

;; with_iterable__cursor__c__last__bit_axiom
  (assert
  (< with_iterable__cursor__c__first__bit with_iterable__cursor__c__last__bit))

;; with_iterable__cursor__c__position_axiom
  (assert (<= 0 with_iterable__cursor__c__position))

(declare-const with_iterable__cursor__i__first__bit Int)

(declare-const with_iterable__cursor__i__last__bit Int)

(declare-const with_iterable__cursor__i__position Int)

;; with_iterable__cursor__i__first__bit_axiom
  (assert (<= 0 with_iterable__cursor__i__first__bit))

;; with_iterable__cursor__i__last__bit_axiom
  (assert
  (< with_iterable__cursor__i__first__bit with_iterable__cursor__i__last__bit))

;; with_iterable__cursor__i__position_axiom
  (assert (<= 0 with_iterable__cursor__i__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ()
((cursor_2__ref (cursor_2__refqtmk (cursor_2__content us_rep)))))
(define-fun cursor_2__ref_cursor_2__content__projection ((a cursor_2__ref)) us_rep 
  (cursor_2__content a))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int natural))))))
(declare-fun slide ((Array Int natural) Int Int) (Array Int natural))

;; slide_eq
  (assert
  (forall ((a (Array Int natural)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int natural)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int natural)) (a__first Int) (a__last Int)
  (b (Array Int natural)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int natural)) (b (Array Int natural)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const dummy3 (Array Int natural))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq3 ((Array Int natural) (Array Int natural)) Bool)

(declare-datatypes ()
((us_split_fields2
 (us_split_fieldsqtmk1
 (rec__with_iterable__container__content (Array Int natural))))))
(define-fun us_split_fields_rec__with_iterable__container__content__projection ((a us_split_fields2)) (Array Int natural) 
  (rec__with_iterable__container__content a))

(declare-datatypes ()
((us_split_fields__ref1
 (us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ()
((us_rep1 (us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq2 ((a us_rep1)
  (b us_rep1)) Bool (ite (= (bool_eq1
                            (rec__with_iterable__container__content
                            (us_split_fields3 a)) 1 100
                            (rec__with_iterable__container__content
                            (us_split_fields3 b)) 1 100) true)
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

(declare-const with_iterable__container__content__first__bit Int)

(declare-const with_iterable__container__content__last__bit Int)

(declare-const with_iterable__container__content__position Int)

;; with_iterable__container__content__first__bit_axiom
  (assert (<= 0 with_iterable__container__content__first__bit))

;; with_iterable__container__content__last__bit_axiom
  (assert
  (< with_iterable__container__content__first__bit with_iterable__container__content__last__bit))

;; with_iterable__container__content__position_axiom
  (assert (<= 0 with_iterable__container__content__position))

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes ()
((container__ref (container__refqtmk (container__content us_rep1)))))
(define-fun container__ref_container__content__projection ((a container__ref)) us_rep1 
  (container__content a))

(declare-const a us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const cu us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun has_element (us_rep1 us_rep) Bool)

(declare-fun has_element__function_guard (Bool us_rep1 us_rep) Bool)

(define-fun in_range2 ((rec__with_iterable__cursor__c1 Int)
  (a1 us_split_discrs)) Bool (= rec__with_iterable__cursor__c1 (to_rep
                                                               (rec__with_iterable__cursor__c
                                                               a1))))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const with_iterable__cursor__c__first__bit1 Int)

(declare-const with_iterable__cursor__c__last__bit1 Int)

(declare-const with_iterable__cursor__c__position1 Int)

;; with_iterable__cursor__c__first__bit_axiom
  (assert (<= 0 with_iterable__cursor__c__first__bit1))

;; with_iterable__cursor__c__last__bit_axiom
  (assert
  (< with_iterable__cursor__c__first__bit1 with_iterable__cursor__c__last__bit1))

;; with_iterable__cursor__c__position_axiom
  (assert (<= 0 with_iterable__cursor__c__position1))

(declare-const with_iterable__cursor__i__first__bit1 Int)

(declare-const with_iterable__cursor__i__last__bit1 Int)

(declare-const with_iterable__cursor__i__position1 Int)

;; with_iterable__cursor__i__first__bit_axiom
  (assert (<= 0 with_iterable__cursor__i__first__bit1))

;; with_iterable__cursor__i__last__bit_axiom
  (assert
  (< with_iterable__cursor__i__first__bit1 with_iterable__cursor__i__last__bit1))

;; with_iterable__cursor__i__position_axiom
  (assert (<= 0 with_iterable__cursor__i__position1))

(declare-fun user_eq5 (us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ()
((cursor__ref (cursor__refqtmk (cursor__content us_rep)))))
(define-fun cursor__ref_cursor__content__projection ((a1 cursor__ref)) us_rep 
  (cursor__content a1))

(define-fun dynamic_invariant ((temp___expr_198 us_rep)
  (temp___is_init_194 Bool) (temp___skip_constant_195 Bool)
  (temp___do_toplevel_196 Bool)
  (temp___do_typ_inv_197 Bool)) Bool (and
                                     (=>
                                     (not (= temp___skip_constant_195 true))
                                     (in_range2 101
                                     (us_split_discrs1 temp___expr_198)))
                                     (=> (= temp___is_init_194 true)
                                     (let ((temp___201 (to_rep
                                                       (rec__with_iterable__cursor__i
                                                       (us_split_fields1
                                                       temp___expr_198)))))
                                     (and (<= 1 temp___201)
                                     (<= temp___201 (to_rep
                                                    (rec__with_iterable__cursor__c
                                                    (us_split_discrs1
                                                    temp___expr_198)))))))))

(define-fun default_initial_assumption ((temp___expr_205 us_rep)
  (temp___skip_top_level_206 Bool)) Bool (= (to_rep
                                            (rec__with_iterable__cursor__c
                                            (us_split_discrs1
                                            temp___expr_205))) 101))

(define-fun dynamic_predicate ((temp___209 us_rep)) Bool (let ((temp___212 
                                                         (to_rep
                                                         (rec__with_iterable__cursor__i
                                                         (us_split_fields1
                                                         temp___209)))))
                                                         (and
                                                         (<= 1 temp___212)
                                                         (<= temp___212 
                                                         (to_rep
                                                         (rec__with_iterable__cursor__c
                                                         (us_split_discrs1
                                                         temp___209)))))))

;; has_element__post_axiom
  (assert true)

;; has_element__def_axiom
  (assert
  (forall ((a1 us_rep1))
  (forall ((cu1 us_rep))
  (! (= (= (has_element a1 cu1) true)
     (let ((temp___229 (to_rep
                       (rec__with_iterable__cursor__i (us_split_fields1 cu1)))))
     (and (<= 1 temp___229) (<= temp___229 100)))) :pattern ((has_element a1
                                                             cu1)) ))))

(declare-const i8s us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant1 ((temp___expr_187 us_rep)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (=> (= temp___do_toplevel_185 true)
                                     (=> (= temp___is_init_183 true)
                                     (let ((temp___189 (to_rep
                                                       (rec__with_iterable__cursor__i
                                                       (us_split_fields1
                                                       temp___expr_187)))))
                                     (and (<= 1 temp___189)
                                     (<= temp___189 (to_rep
                                                    (rec__with_iterable__cursor__c
                                                    (us_split_discrs1
                                                    temp___expr_187)))))))))

(define-fun dynamic_predicate1 ((temp___191 us_rep)) Bool (let ((temp___193 
                                                          (to_rep
                                                          (rec__with_iterable__cursor__i
                                                          (us_split_fields1
                                                          temp___191)))))
                                                          (and
                                                          (<= 1 temp___193)
                                                          (<= temp___193 
                                                          (to_rep
                                                          (rec__with_iterable__cursor__c
                                                          (us_split_discrs1
                                                          temp___191)))))))

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

;; Assume
  (assert (dynamic_invariant1 i8s true false true true))

;; Assume
  (assert (dynamic_invariant1 i8s true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant cu true false true true))

;; H
  (assert (has_element__function_guard (has_element a cu) a cu))

;; Assume
  (assert (= (has_element a cu) true))

(declare-const o Int)

;; Ensures
  (assert
  (= (to_rep (rec__with_iterable__cursor__i (us_split_fields1 cu))) o))

(define-fun o1 () Int (+ o 1))

;; Ensures
  (assert (in_range o1))

;; Ensures
  (assert (in_range1 o1))

(declare-const o2 natural)

;; Ensures
  (assert (= (to_rep o2) o1))

(assert
;; defqtvc
 ;; File "with_iterable.ads", line 23, characters 0-0
  (not (dynamic_predicate
  (us_repqtmk (us_split_discrs1 cu) (us_split_fieldsqtmk o2)))))
(check-sat)

(exit)
