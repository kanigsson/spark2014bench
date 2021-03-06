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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

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
  (forall ((x natural)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-const choose Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__main__rec__comp natural)))))
(define-fun us_split_fields_rec__main__rec__comp__projection ((a us_split_fields)) natural 
  (rec__main__rec__comp a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__main__rec__comp (us_split_fields1 a))) 
                   (to_rep (rec__main__rec__comp (us_split_fields1 b)))) true
                   false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const main__rec__comp__first__bit Int)

(declare-const main__rec__comp__last__bit Int)

(declare-const main__rec__comp__position Int)

;; main__rec__comp__first__bit_axiom
  (assert (<= 0 main__rec__comp__first__bit))

;; main__rec__comp__last__bit_axiom
  (assert (< main__rec__comp__first__bit main__rec__comp__last__bit))

;; main__rec__comp__position_axiom
  (assert (<= 0 main__rec__comp__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((rec____ref 0))
(((rec____refqtmk (rec____content us_rep)))))
(define-fun rec____ref_rec____content__projection ((a rec____ref)) us_rep 
  (rec____content a))

(declare-fun get_rec (tuple0) us_rep)

(declare-fun get_rec__function_guard (us_rep tuple0) Bool)

(define-fun default_initial_assumption ((temp___expr_170 us_rep)
  (temp___skip_top_level_171 Bool)) Bool (= (to_rep
                                            (rec__main__rec__comp
                                            (us_split_fields1
                                            temp___expr_170))) 1234))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 5678))

;; get_rec__post_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (let ((result (get_rec us_void_param)))
     (=> (get_rec__function_guard result us_void_param)
     (= (bool_eq result (us_repqtmk (us_split_fieldsqtmk rliteral))) true))) :pattern (
  (get_rec us_void_param)) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int us_rep))))))
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

(declare-fun get_arr (tuple0) (Array Int us_rep))

(declare-fun get_arr__function_guard ((Array Int us_rep) tuple0) Bool)

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 1 (indexqtint i)) (<= (indexqtint i) 10))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (index index) Bool)

(declare-const dummy3 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(define-fun default_initial_assumption1 ((temp___expr_185 (Array Int us_rep))
  (temp___skip_top_level_186 Bool)) Bool (forall ((temp___187 Int))
                                         (=>
                                         (and (<= 1 temp___187)
                                         (<= temp___187 10))
                                         (= (to_rep
                                            (rec__main__rec__comp
                                            (us_split_fields1
                                            (select temp___expr_185 temp___187)))) 1234))))

(declare-fun temp_____aggregate_def_193 (us_rep) (Array Int us_rep))

(declare-const rliteral1 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral1) 9012))

;; get_arr__post_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (let ((result (get_arr us_void_param)))
     (=> (get_arr__function_guard result us_void_param)
     (= (let ((temp___202 (temp_____aggregate_def_193
                          (us_repqtmk (us_split_fieldsqtmk rliteral1)))))
        (bool_eq1 result 1 10 temp___202 1 10)) true))) :pattern ((get_arr
                                                                  us_void_param)) )))

(declare-fun get_index (Bool) Int)

(declare-fun get_index__function_guard (Int Bool) Bool)

(define-fun dynamic_invariant1 ((temp___expr_176 Int)
  (temp___is_init_172 Bool) (temp___skip_constant_173 Bool)
  (temp___do_toplevel_174 Bool)
  (temp___do_typ_inv_175 Bool)) Bool (=>
                                     (or (= temp___is_init_172 true)
                                     (<= 1 10)) (in_range3 temp___expr_176)))

;; get_index__post_axiom
  (assert
  (forall ((main__cheat Bool))
  (! (let ((result (get_index main__cheat)))
     (=> (get_index__function_guard result main__cheat)
     (and (ite (= main__cheat true) (= result 3) (= result 5))
     (dynamic_invariant1 result true false true true)))) :pattern ((get_index
                                                                   main__cheat)) )))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const the_index Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const r14b (Array Int us_rep))

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const r15b us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const r16b (Array Int us_rep))

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

;; def_axiom
  (assert
  (forall ((temp___195 us_rep))
  (forall ((temp___196 Int))
  (= (select (temp_____aggregate_def_193 temp___195) temp___196) temp___195))))

;; r14b__def_axiom
  (assert
  (and (get_arr__function_guard (get_arr Tuple0) Tuple0)
  (= r14b (get_arr Tuple0))))

;; r15b__def_axiom
  (assert
  (and (get_rec__function_guard (get_rec Tuple0) Tuple0)
  (= r15b (get_rec Tuple0))))

;; r16b__def_axiom
  (assert
  (and (get_arr__function_guard (get_arr Tuple0) Tuple0)
  (= r16b (get_arr Tuple0))))

(declare-const rliteral2 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral2) 0))

(assert
;; defqtvc
 ;; File "main.adb", line 1, characters 0-0
  (not
  (forall ((cheat Bool))
  (=> (dynamic_invariant choose true false true true)
  (=> (= cheat (distinct 1 0))
  (let ((o (get_arr Tuple0)))
  (=>
  (and (get_arr__function_guard o Tuple0)
  (= (bool_eq1 o 1 10
     (temp_____aggregate_def_193
     (us_repqtmk (us_split_fieldsqtmk rliteral1))) 1 10) true))
  (forall ((arr_obj (Array Int us_rep)))
  (=> (= arr_obj o)
  (let ((main__rec_obj__assume (get_rec Tuple0)))
  (=>
  (and (get_rec__function_guard main__rec_obj__assume Tuple0)
  (= (bool_eq main__rec_obj__assume
     (us_repqtmk (us_split_fieldsqtmk rliteral))) true))
  (forall ((rec_obj__split_fields natural))
  (=>
  (= (us_split_fieldsqtmk rec_obj__split_fields) (us_split_fields1
                                                 main__rec_obj__assume))
  (let ((main__the_index__assume (get_index cheat)))
  (=>
  (and (get_index__function_guard main__the_index__assume cheat)
  (and (dynamic_invariant1 main__the_index__assume true false true true)
  (ite (= cheat true) (= main__the_index__assume 3)
  (= main__the_index__assume 5))))
  (=> (= main__the_index__assume the_index)
  (=> (dynamic_invariant1 the_index true false true true)
  (let ((main__R14b__assume (get_arr Tuple0)))
  (=>
  (and (get_arr__function_guard main__R14b__assume Tuple0)
  (= (bool_eq1 main__R14b__assume 1 10
     (temp_____aggregate_def_193
     (us_repqtmk (us_split_fieldsqtmk rliteral1))) 1 10) true))
  (=> (= main__R14b__assume r14b)
  (let ((main__R15b__assume (get_rec Tuple0)))
  (=>
  (and (get_rec__function_guard main__R15b__assume Tuple0)
  (= (bool_eq main__R15b__assume (us_repqtmk (us_split_fieldsqtmk rliteral))) true))
  (=> (= main__R15b__assume r15b)
  (let ((main__R16b__assume (get_arr Tuple0)))
  (=>
  (and (get_arr__function_guard main__R16b__assume Tuple0)
  (= (bool_eq1 main__R16b__assume 1 10
     (temp_____aggregate_def_193
     (us_repqtmk (us_split_fieldsqtmk rliteral1))) 1 10) true))
  (=> (= main__R16b__assume r16b)
  (=>
  (= (to_rep (rec__main__rec__comp (us_split_fields1 (select arr_obj 1)))) 9012)
  (=>
  (= (to_rep
     (rec__main__rec__comp (us_split_fields1 (select arr_obj the_index)))) 9012)
  (=>
  (= (to_rep
     (rec__main__rec__comp (us_split_fields1 (select r14b the_index)))) 9012)
  (=> (= (to_rep rec_obj__split_fields) 5678)
  (=> (= (to_rep (rec__main__rec__comp (us_split_fields1 r15b))) 5678)
  (=>
  (= (to_rep
     (rec__main__rec__comp (us_split_fields1 (select r16b the_index)))) 9012)
  (forall ((arr_obj1 (Array Int us_rep)))
  (=>
  (= arr_obj1 (store arr_obj 1 (us_repqtmk (us_split_fieldsqtmk rliteral2))))
  (forall ((o1 Int))
  (=>
  (= (to_rep
     (rec__main__rec__comp (us_split_fields1 (select arr_obj1 the_index)))) o1)
  (let ((o2 (+ o1 1)))
  (=> (in_range1 o2)
  (forall ((o3 natural))
  (=> (= (to_rep o3) o2)
  (forall ((arr_obj2 (Array Int us_rep)))
  (=>
  (= arr_obj2 (store arr_obj1 the_index (us_repqtmk (us_split_fieldsqtmk o3))))
  (forall ((rec_obj__split_fields1 natural))
  (=> (= rec_obj__split_fields1 rliteral2)
  (forall ((spark__branch Bool))
  (=> (= spark__branch (ite (= choose 0) true false))
  (=> (not (= spark__branch true))
  (forall ((spark__branch1 Bool))
  (=> (= spark__branch1 (ite (= choose 1) true false))
  (=> (not (= spark__branch1 true))
  (forall ((spark__branch2 Bool))
  (=> (= spark__branch2 (ite (= choose 2) true false))
  (=> (= spark__branch2 true) (= (to_rep rec_obj__split_fields1) 5678))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
