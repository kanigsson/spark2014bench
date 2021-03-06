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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int natural))))))
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

(define-fun bool_eq ((a (Array Int natural)) (a__first Int) (a__last Int)
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
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const dummy1 (Array Int natural))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq1 ((Array Int natural) (Array Int natural)) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__with_iterable__container__content (Array Int natural))))))
(define-fun us_split_fields_rec__with_iterable__container__content__projection ((a us_split_fields)) (Array Int natural) 
  (rec__with_iterable__container__content a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (= (bool_eq
                           (rec__with_iterable__container__content
                           (us_split_fields1 a)) 1 100
                           (rec__with_iterable__container__content
                           (us_split_fields1 b)) 1 100) true)
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

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((container__ref 0))
(((container__refqtmk (container__content us_rep)))))
(define-fun container__ref_container__content__projection ((a container__ref)) us_rep 
  (container__content a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__with_iterable__cursor__c natural)))))
(define-fun us_split_discrs_rec__with_iterable__cursor__c__projection ((a us_split_discrs)) natural 
  (rec__with_iterable__cursor__c a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__with_iterable__cursor__i natural)))))
(define-fun us_split_fields_rec__with_iterable__cursor__i__projection ((a us_split_fields2)) natural 
  (rec__with_iterable__cursor__i a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs1 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq2 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__with_iterable__cursor__c
                            (us_split_discrs1 a))) (to_rep
                                                   (rec__with_iterable__cursor__c
                                                   (us_split_discrs1 b))))
                         (= (to_rep
                            (rec__with_iterable__cursor__i
                            (us_split_fields3 a))) (to_rep
                                                   (rec__with_iterable__cursor__i
                                                   (us_split_fields3 b)))))
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

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((cursor_2__ref 0))
(((cursor_2__refqtmk (cursor_2__content us_rep1)))))
(define-fun cursor_2__ref_cursor_2__content__projection ((a cursor_2__ref)) us_rep1 
  (cursor_2__content a))

(declare-fun has_element (us_rep us_rep1) Bool)

(declare-fun has_element__function_guard (Bool us_rep us_rep1) Bool)

(define-fun in_range1 ((rec__with_iterable__cursor__c1 Int)
  (a us_split_discrs)) Bool (= rec__with_iterable__cursor__c1 (to_rep
                                                              (rec__with_iterable__cursor__c
                                                              a))))

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

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes ((cursor__ref 0))
(((cursor__refqtmk (cursor__content us_rep1)))))
(define-fun cursor__ref_cursor__content__projection ((a cursor__ref)) us_rep1 
  (cursor__content a))

(define-fun dynamic_invariant ((temp___expr_198 us_rep1)
  (temp___is_init_194 Bool) (temp___skip_constant_195 Bool)
  (temp___do_toplevel_196 Bool)
  (temp___do_typ_inv_197 Bool)) Bool (and
                                     (=>
                                     (not (= temp___skip_constant_195 true))
                                     (in_range1 101
                                     (us_split_discrs1 temp___expr_198)))
                                     (=> (= temp___is_init_194 true)
                                     (let ((temp___201 (to_rep
                                                       (rec__with_iterable__cursor__i
                                                       (us_split_fields3
                                                       temp___expr_198)))))
                                     (and (<= 1 temp___201)
                                     (<= temp___201 (to_rep
                                                    (rec__with_iterable__cursor__c
                                                    (us_split_discrs1
                                                    temp___expr_198)))))))))

(define-fun default_initial_assumption ((temp___expr_205 us_rep1)
  (temp___skip_top_level_206 Bool)) Bool (= (to_rep
                                            (rec__with_iterable__cursor__c
                                            (us_split_discrs1
                                            temp___expr_205))) 101))

(define-fun dynamic_predicate ((temp___209 us_rep1)) Bool (let ((temp___212 
                                                          (to_rep
                                                          (rec__with_iterable__cursor__i
                                                          (us_split_fields3
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
  (forall ((a us_rep))
  (forall ((cu us_rep1))
  (! (= (= (has_element a cu) true)
     (let ((temp___229 (to_rep
                       (rec__with_iterable__cursor__i (us_split_fields3 cu)))))
     (and (<= 1 temp___229) (<= temp___229 100)))) :pattern ((has_element a
                                                             cu)) ))))

(declare-fun contains_0 (us_rep) Bool)

(declare-fun contains_0__function_guard (Bool us_rep) Bool)

(declare-fun get (us_rep Int) Int)

(declare-fun get__function_guard (Int us_rep Int) Bool)

;; contains_0__post_axiom
  (assert true)

;; contains_0__def_axiom
  (assert
  (forall ((a us_rep))
  (! (and
     (forall ((a1 us_rep) (cu us_rep1)) (has_element__function_guard
     (has_element a1 cu) a1 cu))
     (and
     (forall ((a1 us_rep) (cu us_rep1)) (get__function_guard
     (get a1 (to_rep (rec__with_iterable__cursor__i (us_split_fields3 cu))))
     a1 (to_rep (rec__with_iterable__cursor__i (us_split_fields3 cu)))))
     (= (= (contains_0 a) true)
     (exists ((cu us_rep1))
     (and
     (and (dynamic_invariant cu true false true true)
     (= (has_element a cu) true))
     (= (get a
        (to_rep (rec__with_iterable__cursor__i (us_split_fields3 cu)))) 0)))))) :pattern (
  (contains_0 a)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const first__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-const with_iterable__cursor__c__first__bit2 Int)

(declare-const with_iterable__cursor__c__last__bit2 Int)

(declare-const with_iterable__cursor__c__position2 Int)

;; with_iterable__cursor__c__first__bit_axiom
  (assert (<= 0 with_iterable__cursor__c__first__bit2))

;; with_iterable__cursor__c__last__bit_axiom
  (assert
  (< with_iterable__cursor__c__first__bit2 with_iterable__cursor__c__last__bit2))

;; with_iterable__cursor__c__position_axiom
  (assert (<= 0 with_iterable__cursor__c__position2))

(declare-const with_iterable__cursor__i__first__bit2 Int)

(declare-const with_iterable__cursor__i__last__bit2 Int)

(declare-const with_iterable__cursor__i__position2 Int)

;; with_iterable__cursor__i__first__bit_axiom
  (assert (<= 0 with_iterable__cursor__i__first__bit2))

;; with_iterable__cursor__i__last__bit_axiom
  (assert
  (< with_iterable__cursor__i__first__bit2 with_iterable__cursor__i__last__bit2))

;; with_iterable__cursor__i__position_axiom
  (assert (<= 0 with_iterable__cursor__i__position2))

(declare-fun user_eq5 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ((t1b__ref 0))
(((t1b__refqtmk (t1b__content us_rep1)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) us_rep1 
  (t1b__content a))

(define-fun dynamic_predicate1 ((temp___253 us_rep1)) Bool (let ((temp___255 
                                                           (to_rep
                                                           (rec__with_iterable__cursor__i
                                                           (us_split_fields3
                                                           temp___253)))))
                                                           (and
                                                           (<= 1 temp___255)
                                                           (<= temp___255 
                                                           (to_rep
                                                           (rec__with_iterable__cursor__c
                                                           (us_split_discrs1
                                                           temp___253)))))))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(define-fun dynamic_invariant2 ((temp___expr_187 us_rep1)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (=> (= temp___do_toplevel_185 true)
                                     (=> (= temp___is_init_183 true)
                                     (let ((temp___189 (to_rep
                                                       (rec__with_iterable__cursor__i
                                                       (us_split_fields3
                                                       temp___expr_187)))))
                                     (and (<= 1 temp___189)
                                     (<= temp___189 (to_rep
                                                    (rec__with_iterable__cursor__c
                                                    (us_split_discrs1
                                                    temp___expr_187)))))))))

(define-fun dynamic_predicate2 ((temp___191 us_rep1)) Bool (let ((temp___193 
                                                           (to_rep
                                                           (rec__with_iterable__cursor__i
                                                           (us_split_fields3
                                                           temp___191)))))
                                                           (and
                                                           (<= 1 temp___193)
                                                           (<= temp___193 
                                                           (to_rep
                                                           (rec__with_iterable__cursor__c
                                                           (us_split_discrs1
                                                           temp___191)))))))

;; get__post_axiom
  (assert
  (forall ((a us_rep))
  (forall ((i Int))
  (! (=>
     (and (dynamic_invariant1 i true true true true)
     (and (<= 1 i) (<= i 100)))
     (let ((result (get a i)))
     (=> (get__function_guard result a i) (dynamic_invariant1 result true
     false true true)))) :pattern ((get a i)) ))))

;; get__def_axiom
  (assert
  (forall ((a us_rep))
  (forall ((i Int))
  (! (=> (dynamic_invariant1 i true true true true)
     (= (get a i) (to_rep
                  (let ((temp___216 (rec__with_iterable__container__content
                                    (us_split_fields1 a))))
                  (select temp___216 i))))) :pattern ((get a i)) ))))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 101))

(declare-const rliteral1 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral1) 1))

(declare-const rliteral2 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral2) 0))

(assert
;; defqtvc
 ;; File "with_iterable.ads", line 32, characters 0-0
  (not
  (forall ((a__split_fields (Array Int natural)))
  (let ((temp___279 (us_repqtmk1 (us_split_discrsqtmk rliteral)
                    (us_split_fieldsqtmk1 rliteral1))))
  (=> (dynamic_predicate1 temp___279)
  (=> (dynamic_predicate temp___279)
  (forall ((first__split_fields natural))
  (=>
  (= (us_split_fieldsqtmk1 first__split_fields) (us_split_fields3 temp___279))
  (=> (= first__split_discrs (us_split_discrs1 temp___279))
  (=> (dynamic_invariant
  (us_repqtmk1 first__split_discrs
  (us_split_fieldsqtmk1 first__split_fields)) true false true true)
  (forall ((a__split_fields1 (Array Int natural)))
  (=> (= a__split_fields1 (store a__split_fields 1 rliteral2))
  (=>
  (forall ((first__split_fields1 natural)
  (a__split_fields2 (Array Int natural))) (has_element__function_guard
  (has_element (us_repqtmk (us_split_fieldsqtmk a__split_fields2))
  (us_repqtmk1 first__split_discrs
  (us_split_fieldsqtmk1 first__split_fields1)))
  (us_repqtmk (us_split_fieldsqtmk a__split_fields2))
  (us_repqtmk1 first__split_discrs
  (us_split_fieldsqtmk1 first__split_fields1))))
  (=>
  (= (has_element (us_repqtmk (us_split_fieldsqtmk a__split_fields1))
     (us_repqtmk1 first__split_discrs
     (us_split_fieldsqtmk1 first__split_fields))) true)
  (=>
  (forall ((a__split_fields2 (Array Int natural)))
  (contains_0__function_guard
  (contains_0 (us_repqtmk (us_split_fieldsqtmk a__split_fields2)))
  (us_repqtmk (us_split_fieldsqtmk a__split_fields2))))
  (= (contains_0 (us_repqtmk (us_split_fieldsqtmk a__split_fields1))) true))))))))))))))))
(check-sat)
(exit)
