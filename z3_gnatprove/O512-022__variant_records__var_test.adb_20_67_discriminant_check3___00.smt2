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

(declare-sort node_id 0)

(declare-fun node_idqtint (node_id) Int)

;; node_id'axiom
  (assert
  (forall ((i node_id))
  (and (<= 1 (node_idqtint i)) (<= (node_idqtint i) 1000))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (node_id node_id) Bool)

(declare-const dummy node_id)

(declare-datatypes ()
((node_id__ref (node_id__refqtmk (node_id__content node_id)))))
(define-fun node_id__ref_node_id__content__projection ((a node_id__ref)) node_id 
  (node_id__content a))

(define-fun to_rep ((x node_id)) Int (node_idqtint x))

(declare-fun of_rep (Int) node_id)

;; inversion_axiom
  (assert
  (forall ((x node_id)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x node_id)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort decision_kind 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (decision_kind decision_kind) Bool)

(declare-const dummy1 decision_kind)

(declare-datatypes ()
((decision_kind__ref
 (decision_kind__refqtmk (decision_kind__content decision_kind)))))
(define-fun decision_kind__ref_decision_kind__content__projection ((a decision_kind__ref)) decision_kind 
  (decision_kind__content a))

(declare-fun to_rep1 (decision_kind) Int)

(declare-fun of_rep1 (Int) decision_kind)

;; inversion_axiom
  (assert
  (forall ((x decision_kind))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x decision_kind)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk (rec__var__decision__kind decision_kind)))))
(define-fun us_split_discrs_rec__var__decision__kind__projection ((a us_split_discrs)) decision_kind 
  (rec__var__decision__kind a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__var__decision__id node_id)(rec__var__decision__operand node_id)(rec__var__decision__left node_id)(rec__var__decision__right node_id)))))
(define-fun us_split_fields_rec__var__decision__id__projection ((a us_split_fields)) node_id 
  (rec__var__decision__id a))

(define-fun us_split_fields_rec__var__decision__operand__projection ((a us_split_fields)) node_id 
  (rec__var__decision__operand a))

(define-fun us_split_fields_rec__var__decision__left__projection ((a us_split_fields)) node_id 
  (rec__var__decision__left a))

(define-fun us_split_fields_rec__var__decision__right__projection ((a us_split_fields)) node_id 
  (rec__var__decision__right a))

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

(define-fun var__decision__operand__pred ((a us_rep)) Bool (= (to_rep1
                                                              (rec__var__decision__kind
                                                              (us_split_discrs1
                                                              a))) 1))

(define-fun var__decision__left__pred ((a us_rep)) Bool (or
                                                        (= (to_rep1
                                                           (rec__var__decision__kind
                                                           (us_split_discrs1
                                                           a))) 2)
                                                        (= (to_rep1
                                                           (rec__var__decision__kind
                                                           (us_split_discrs1
                                                           a))) 3)))

(define-fun var__decision__right__pred ((a us_rep)) Bool (or
                                                         (= (to_rep1
                                                            (rec__var__decision__kind
                                                            (us_split_discrs1
                                                            a))) 2)
                                                         (= (to_rep1
                                                            (rec__var__decision__kind
                                                            (us_split_discrs1
                                                            a))) 3)))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep1
                           (rec__var__decision__kind (us_split_discrs1 a))) 
                        (to_rep1
                        (rec__var__decision__kind (us_split_discrs1 b))))
                        (and
                        (and
                        (= (to_rep
                           (rec__var__decision__id (us_split_fields1 a))) 
                        (to_rep
                        (rec__var__decision__id (us_split_fields1 b))))
                        (=> (var__decision__operand__pred a)
                        (= (to_rep
                           (rec__var__decision__operand (us_split_fields1 a))) 
                        (to_rep
                        (rec__var__decision__operand (us_split_fields1 b))))))
                        (and
                        (=> (var__decision__left__pred a)
                        (= (to_rep
                           (rec__var__decision__left (us_split_fields1 a))) 
                        (to_rep
                        (rec__var__decision__left (us_split_fields1 b)))))
                        (=> (var__decision__right__pred a)
                        (= (to_rep
                           (rec__var__decision__right (us_split_fields1 a))) 
                        (to_rep
                        (rec__var__decision__right (us_split_fields1 b))))))))
                   true false))

(define-fun in_range3 ((rec__var__decision__kind1 Int)
  (a us_split_discrs)) Bool (= rec__var__decision__kind1 (to_rep1
                                                         (rec__var__decision__kind
                                                         a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const var__decision__kind__first__bit Int)

(declare-const var__decision__kind__last__bit Int)

(declare-const var__decision__kind__position Int)

;; var__decision__kind__first__bit_axiom
  (assert (<= 0 var__decision__kind__first__bit))

;; var__decision__kind__last__bit_axiom
  (assert (< var__decision__kind__first__bit var__decision__kind__last__bit))

;; var__decision__kind__position_axiom
  (assert (<= 0 var__decision__kind__position))

(declare-const var__decision__id__first__bit Int)

(declare-const var__decision__id__last__bit Int)

(declare-const var__decision__id__position Int)

;; var__decision__id__first__bit_axiom
  (assert (<= 0 var__decision__id__first__bit))

;; var__decision__id__last__bit_axiom
  (assert (< var__decision__id__first__bit var__decision__id__last__bit))

;; var__decision__id__position_axiom
  (assert (<= 0 var__decision__id__position))

(declare-const var__decision__operand__first__bit Int)

(declare-const var__decision__operand__last__bit Int)

(declare-const var__decision__operand__position Int)

;; var__decision__operand__first__bit_axiom
  (assert (<= 0 var__decision__operand__first__bit))

;; var__decision__operand__last__bit_axiom
  (assert
  (< var__decision__operand__first__bit var__decision__operand__last__bit))

;; var__decision__operand__position_axiom
  (assert (<= 0 var__decision__operand__position))

(declare-const var__decision__left__first__bit Int)

(declare-const var__decision__left__last__bit Int)

(declare-const var__decision__left__position Int)

;; var__decision__left__first__bit_axiom
  (assert (<= 0 var__decision__left__first__bit))

;; var__decision__left__last__bit_axiom
  (assert (< var__decision__left__first__bit var__decision__left__last__bit))

;; var__decision__left__position_axiom
  (assert (<= 0 var__decision__left__position))

(declare-const var__decision__right__first__bit Int)

(declare-const var__decision__right__last__bit Int)

(declare-const var__decision__right__position Int)

;; var__decision__right__first__bit_axiom
  (assert (<= 0 var__decision__right__first__bit))

;; var__decision__right__last__bit_axiom
  (assert
  (< var__decision__right__first__bit var__decision__right__last__bit))

;; var__decision__right__position_axiom
  (assert (<= 0 var__decision__right__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ()
((decision__ref (decision__refqtmk (decision__content us_rep)))))
(define-fun decision__ref_decision__content__projection ((a decision__ref)) us_rep 
  (decision__content a))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int us_rep))))))
(declare-fun slide ((Array Int us_rep) Int Int) (Array Int us_rep))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int us_rep)) (a__first Int) (a__last Int)
  (b (Array Int us_rep)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (bool_eq (select a temp___idx_154)
                              (select b (+ (- b__first a__first) temp___idx_154))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep)) (b (Array Int us_rep)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (bool_eq (select a temp___idx_154)
     (select b (+ (- b__first a__first) temp___idx_154))) true))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort tristate 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (tristate tristate) Bool)

(declare-const dummy3 tristate)

(declare-datatypes ()
((tristate__ref (tristate__refqtmk (tristate__content tristate)))))
(define-fun tristate__ref_tristate__content__projection ((a tristate__ref)) tristate 
  (tristate__content a))

(declare-fun to_rep2 (tristate) Int)

(declare-fun of_rep2 (Int) tristate)

;; inversion_axiom
  (assert
  (forall ((x tristate))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x tristate)) (! (in_range4 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ()
((map__ref1 (map__refqtmk1 (map__content1 (Array Int tristate))))))
(declare-fun slide1 ((Array Int tristate) Int Int) (Array Int tristate))

;; slide_eq
  (assert
  (forall ((a (Array Int tristate)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int tristate)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array Int tristate)) (a__first Int) (a__last Int)
  (b (Array Int tristate)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (to_rep2 (select a temp___idx_155)) (to_rep2
                                                                  (select b (+ (- b__first a__first) temp___idx_155)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int tristate)) (b (Array Int tristate)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (to_rep2 (select a temp___idx_155)) (to_rep2
                                         (select b (+ (- b__first a__first) temp___idx_155)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const root_id Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun decision_eval (Int (Array Int us_rep) (Array Int tristate)) Int)

(declare-fun decision_eval__function_guard (Int Int (Array Int us_rep)
  (Array Int tristate)) Bool)

(define-fun dynamic_invariant ((temp___expr_191 Int)
  (temp___is_init_187 Bool) (temp___skip_constant_188 Bool)
  (temp___do_toplevel_189 Bool)
  (temp___do_typ_inv_190 Bool)) Bool (=>
                                     (or (= temp___is_init_187 true)
                                     (<= 0 2)) (in_range4 temp___expr_191)))

;; decision_eval__post_axiom
  (assert
  (forall ((root_id1 Int))
  (forall ((var_test__decision_table (Array Int us_rep)))
  (forall ((var_test__condition_values (Array Int tristate))) (! (in_range4
  (decision_eval root_id1 var_test__decision_table
  var_test__condition_values)) :pattern ((decision_eval root_id1
                                         var_test__decision_table
                                         var_test__condition_values)) )))))

(declare-const d__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun default_initial_assumption ((temp___expr_180 us_rep)
  (temp___skip_top_level_181 Bool)) Bool (= (to_rep1
                                            (rec__var__decision__kind
                                            (us_split_discrs1
                                            temp___expr_180))) 0))

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-fun t_not (Int) Int)

(declare-fun t_not__function_guard (Int Int) Bool)

;; t_not__post_axiom
  (assert
  (forall ((op Int))
  (! (=> (dynamic_invariant op true true true true)
     (let ((result (t_not op)))
     (=> (t_not__function_guard result op) (dynamic_invariant result true
     false true true)))) :pattern ((t_not op)) )))

;; t_not__def_axiom
  (assert
  (forall ((op Int))
  (! (=> (dynamic_invariant op true true true true)
     (= (t_not op) (ite (= op 0) 1 0))) :pattern ((t_not op)) )))

(declare-fun t_or (Int Int) Int)

(declare-fun t_or__function_guard (Int Int Int) Bool)

;; t_or__post_axiom
  (assert
  (forall ((left Int) (right Int))
  (! (=>
     (and (dynamic_invariant left true true true true) (dynamic_invariant
     right true true true true))
     (let ((result (t_or left right)))
     (=> (t_or__function_guard result left right) (dynamic_invariant result
     true false true true)))) :pattern ((t_or left right)) )))

;; t_or__def_axiom
  (assert
  (forall ((left Int) (right Int))
  (! (=>
     (and (dynamic_invariant left true true true true) (dynamic_invariant
     right true true true true))
     (= (t_or left right) (ite (= left 0) 0 (ite (= left 1) right 2)))) :pattern (
  (t_or left right)) )))

(declare-fun t_and (Int Int) Int)

(declare-fun t_and__function_guard (Int Int Int) Bool)

;; t_and__post_axiom
  (assert
  (forall ((left Int) (right Int))
  (! (=>
     (and (dynamic_invariant left true true true true) (dynamic_invariant
     right true true true true))
     (let ((result (t_and left right)))
     (=> (t_and__function_guard result left right) (dynamic_invariant result
     true false true true)))) :pattern ((t_and left right)) )))

;; t_and__def_axiom
  (assert
  (forall ((left Int) (right Int))
  (! (=>
     (and (dynamic_invariant left true true true true) (dynamic_invariant
     right true true true true))
     (= (t_and left right) (ite (= left 1) 1 (ite (= left 0) right 2)))) :pattern (
  (t_and left right)) )))

(define-fun dynamic_invariant1 ((temp___expr_164 Int)
  (temp___is_init_160 Bool) (temp___skip_constant_161 Bool)
  (temp___do_toplevel_162 Bool)
  (temp___do_typ_inv_163 Bool)) Bool (=>
                                     (or (= temp___is_init_160 true)
                                     (<= 1 1000)) (in_range1
                                     temp___expr_164)))

(define-fun dynamic_invariant2 ((temp___expr_171 Int)
  (temp___is_init_167 Bool) (temp___skip_constant_168 Bool)
  (temp___do_toplevel_169 Bool)
  (temp___do_typ_inv_170 Bool)) Bool (=>
                                     (or (= temp___is_init_167 true)
                                     (<= 0 3)) (in_range2 temp___expr_171)))

(declare-const decision_table (Array Int us_rep))

(declare-const condition_values (Array Int tristate))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 root_id true false true true))

;; Assume
  (assert
  (forall ((x Int))
  (=> (and (<= 1 x) (<= x 1000))
  (not (= (to_rep2 (select condition_values x)) 2)))))

(define-fun var_test__decision_eval__d__assume () us_rep (select decision_table 
  root_id))

(declare-const d__split_fields us_split_fields)

;; H
  (assert
  (= d__split_fields (us_split_fields1 var_test__decision_eval__d__assume)))

(declare-const d__split_discrs decision_kind)

;; H
  (assert
  (= (us_split_discrsqtmk d__split_discrs) (us_split_discrs1
                                           var_test__decision_eval__d__assume)))

;; Assume
  (assert (= d__attr__constrained false))

;; Assume
  (assert true)

(declare-const o Int)

;; Ensures
  (assert (= (to_rep1 d__split_discrs) o))

(declare-const kind Int)

;; H
  (assert (= kind o))

;; Assume
  (assert (dynamic_invariant2 kind true false true true))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch (ite (= kind 0) true false)))

;; H
  (assert (not (= spark__branch true)))

(declare-const spark__branch1 Bool)

;; H
  (assert (= spark__branch1 (ite (= kind 1) true false)))

;; H
  (assert (not (= spark__branch1 true)))

(declare-const spark__branch2 Bool)

;; H
  (assert (= spark__branch2 (ite (= kind 2) true false)))

;; H
  (assert (not (= spark__branch2 true)))

(assert
;; defqtvc
 ;; File "var_test.ads", line 9, characters 0-0
  (not (var__decision__right__pred
  (us_repqtmk (us_split_discrsqtmk d__split_discrs) d__split_fields))))
(check-sat)
