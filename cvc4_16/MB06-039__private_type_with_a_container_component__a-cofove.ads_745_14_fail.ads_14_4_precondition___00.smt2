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

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-sort us_rep 0)

(declare-fun bool_eq (us_rep us_rep) Bool)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq (us_rep us_rep) Bool)

(declare-const dummy us_rep)

(declare-datatypes ((sequence__ref 0))
(((sequence__refqtmk (sequence__content us_rep)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep 
  (sequence__content a))

(declare-sort capacity_range 0)

(declare-fun capacity_rangeqtint (capacity_range) Int)

;; capacity_range'axiom
  (assert
  (forall ((i capacity_range))
  (and (<= 0 (capacity_rangeqtint i)) (<= (capacity_rangeqtint i) 3))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (capacity_range capacity_range) Bool)

(declare-const dummy1 capacity_range)

(declare-datatypes ((capacity_range__ref 0))
(((capacity_range__refqtmk (capacity_range__content capacity_range)))))
(define-fun capacity_range__ref_capacity_range__content__projection ((a capacity_range__ref)) capacity_range 
  (capacity_range__content a))

(define-fun to_rep ((x capacity_range)) Int (capacity_rangeqtint x))

(declare-fun of_rep (Int) capacity_range)

;; inversion_axiom
  (assert
  (forall ((x capacity_range))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x capacity_range)) (! (in_range1
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__fail__my_lists__vector__capacity capacity_range)))))
(define-fun us_split_discrs_rec__fail__my_lists__vector__capacity__projection ((a us_split_discrs)) capacity_range 
  (rec__fail__my_lists__vector__capacity a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__fail__my_lists__vector us_main_type1)))))
(define-fun us_split_fields_rec__fail__my_lists__vector__projection ((a us_split_fields)) us_main_type1 
  (rec__fail__my_lists__vector a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__fail__my_lists__vector__capacity
                            (us_split_discrs1 a))) (to_rep
                                                   (rec__fail__my_lists__vector__capacity
                                                   (us_split_discrs1 b))))
                         (= (us_main_eq1
                            (rec__fail__my_lists__vector
                            (us_split_fields1 a))
                            (rec__fail__my_lists__vector
                            (us_split_fields1 b))) true))
                    true false))

(define-fun in_range2 ((rec__fail__my_lists__vector__capacity1 Int)
  (a us_split_discrs)) Bool (= rec__fail__my_lists__vector__capacity1 
  (to_rep (rec__fail__my_lists__vector__capacity a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const fail__my_lists__vector__capacity__first__bit Int)

(declare-const fail__my_lists__vector__capacity__last__bit Int)

(declare-const fail__my_lists__vector__capacity__position Int)

;; fail__my_lists__vector__capacity__first__bit_axiom
  (assert (<= 0 fail__my_lists__vector__capacity__first__bit))

;; fail__my_lists__vector__capacity__last__bit_axiom
  (assert
  (< fail__my_lists__vector__capacity__first__bit fail__my_lists__vector__capacity__last__bit))

;; fail__my_lists__vector__capacity__position_axiom
  (assert (<= 0 fail__my_lists__vector__capacity__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((vector__ref 0))
(((vector__refqtmk (vector__content us_rep1)))))
(define-fun vector__ref_vector__content__projection ((a vector__ref)) us_rep1 
  (vector__content a))

(declare-fun model1 (us_rep1) us_rep)

(declare-fun model__function_guard (us_rep us_rep1) Bool)

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(declare-fun length1 (us_rep1) Int)

(declare-fun length__function_guard1 (Int us_rep1) Bool)

(declare-fun oeq (us_rep1 us_rep1) Bool)

(declare-fun oeq__function_guard (Bool us_rep1 us_rep1) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep1) (b us_rep1))
  (! (= (user_eq2 a b) (oeq a b)) :pattern ((user_eq2 a b)) )))

(define-fun length2 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun last ((container us_rep)) Int (+ 0 (length container)))

(declare-fun last__function_guard (Int us_rep) Bool)

(declare-fun get (us_rep Int) Int)

(declare-fun get__function_guard (Int us_rep Int) Bool)

(define-fun oeq1 ((left us_rep)
  (right us_rep)) Bool (and (= (length left) (length right)) (ite (forall
                                                                  ((n Int))
                                                                  (=>
                                                                  (and
                                                                  (<= 1 n)
                                                                  (<= n 
                                                                  (last left)))
                                                                  (= 
                                                                  (get left
                                                                  n) 
                                                                  (get right
                                                                  n))))
                                                             true false)))

(declare-fun oeq__function_guard1 (Bool us_rep us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq a b) (oeq1 a b)) :pattern ((user_eq a b)) )))

(define-fun default_initial_assumption ((temp___expr_235 us_rep)
  (temp___skip_top_level_236 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_236 true))
                                         (= (length temp___expr_235) 0)))

;; model__post_axiom
  (assert
  (forall ((container us_rep1))
  (! (= (length (model1 container)) (length1 container)) :pattern ((model1
                                                                   container)) )))

(define-fun contains ((container us_rep) (fst Int) (lst Int)
  (item Int)) Bool (ite (exists ((i Int))
                        (and (and (<= fst i) (<= i lst))
                        (= (get container i) item)))
                   true false))

(declare-fun contains__function_guard (Bool us_rep Int Int Int) Bool)

(define-fun last_index ((container us_rep1)) Int (last (model1 container)))

(declare-fun last_index__function_guard (Int us_rep1) Bool)

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i)) (<= (extended_indexqtint i) 4))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq3 (extended_index extended_index) Bool)

(declare-const dummy3 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__2__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant ((temp___expr_295 Int)
  (temp___is_init_291 Bool) (temp___skip_constant_292 Bool)
  (temp___do_toplevel_293 Bool)
  (temp___do_typ_inv_294 Bool)) Bool (=>
                                     (or (= temp___is_init_291 true)
                                     (<= 0 4)) (in_range3 temp___expr_295)))

(declare-const container us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const item Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const index Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 1 (index_typeqtint i)) (<= (index_typeqtint i) 3))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (index_type index_type) Bool)

(declare-const dummy4 index_type)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_249 Int)
  (temp___is_init_245 Bool) (temp___skip_constant_246 Bool)
  (temp___do_toplevel_247 Bool)
  (temp___do_typ_inv_248 Bool)) Bool (=>
                                     (or (= temp___is_init_245 true)
                                     (<= 1 3)) (in_range4 temp___expr_249)))

(declare-sort extended_index1 0)

(declare-fun extended_indexqtint1 (extended_index1) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index1))
  (and (<= 0 (extended_indexqtint1 i)) (<= (extended_indexqtint1 i) 3))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (extended_index1 extended_index1) Bool)

(declare-const dummy5 extended_index1)

(declare-datatypes ((extended_index__ref1 0))
(((extended_index__refqtmk1 (extended_index__content1 extended_index1)))))
(define-fun extended_index__ref_extended_index__content__projection ((a extended_index__ref1)) extended_index1 
  (extended_index__content1 a))

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= (- 2147483648) (element_typeqtint i))
  (<= (element_typeqtint i) 2147483647))))

(define-fun in_range6 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq6 (element_type element_type) Bool)

(declare-const dummy6 element_type)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant2 ((temp___expr_270 Int)
  (temp___is_init_266 Bool) (temp___skip_constant_267 Bool)
  (temp___do_toplevel_268 Bool)
  (temp___do_typ_inv_269 Bool)) Bool (=>
                                     (or (= temp___is_init_266 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range6 temp___expr_270)))

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range7 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq7 (count_type count_type) Bool)

(declare-const dummy7 count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun dynamic_invariant3 ((temp___expr_204 Int)
  (temp___is_init_200 Bool) (temp___skip_constant_201 Bool)
  (temp___do_toplevel_202 Bool)
  (temp___do_typ_inv_203 Bool)) Bool (=>
                                     (or (= temp___is_init_200 true)
                                     (<= 0 2147483647)) (in_range7
                                     temp___expr_204)))

(define-fun dynamic_invariant4 ((temp___expr_211 Int)
  (temp___is_init_207 Bool) (temp___skip_constant_208 Bool)
  (temp___do_toplevel_209 Bool)
  (temp___do_typ_inv_210 Bool)) Bool (=>
                                     (or (= temp___is_init_207 true)
                                     (<= 0 3)) (in_range1 temp___expr_211)))

(define-fun capacity ((container1 us_rep1)) Int (to_rep
                                                (rec__fail__my_lists__vector__capacity
                                                (us_split_discrs1 container1))))

(declare-fun capacity__function_guard (Int us_rep1) Bool)

;; length__post_axiom
  (assert
  (forall ((container1 us_rep1))
  (! (let ((result (length1 container1)))
     (and (<= result (capacity container1)) (dynamic_invariant4 result true
     false true true))) :pattern ((length1 container1)) )))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep1) (right us_rep1))
  (! (= (= (oeq left right) true)
     (= (oeq1 (model1 left) (model1 right)) true)) :pattern ((oeq left right)) )))

(define-fun dynamic_invariant5 ((temp___expr_263 Int)
  (temp___is_init_259 Bool) (temp___skip_constant_260 Bool)
  (temp___do_toplevel_261 Bool)
  (temp___do_typ_inv_262 Bool)) Bool (=>
                                     (or (= temp___is_init_259 true)
                                     (<= 0 3)) (in_range5 temp___expr_263)))

;; length__post_axiom
  (assert
  (forall ((container1 us_rep))
  (! (let ((result (length container1)))
     (and (<= (+ 0 result) 3) (dynamic_invariant3 result true false true
     true))) :pattern ((length container1)) )))

(declare-sort element_type1 0)

(declare-fun element_typeqtint1 (element_type1) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type1))
  (and (<= (- 2147483648) (element_typeqtint1 i))
  (<= (element_typeqtint1 i) 2147483647))))

(define-fun in_range8 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq8 (element_type1 element_type1) Bool)

(declare-const dummy8 element_type1)

(declare-datatypes ((element_type__ref1 0))
(((element_type__refqtmk1 (element_type__content1 element_type1)))))
(define-fun element_type__ref_element_type__content__2__projection ((a element_type__ref1)) element_type1 
  (element_type__content1 a))

(define-fun dynamic_invariant6 ((temp___expr_277 Int)
  (temp___is_init_273 Bool) (temp___skip_constant_274 Bool)
  (temp___do_toplevel_275 Bool)
  (temp___do_typ_inv_276 Bool)) Bool (=>
                                     (or (= temp___is_init_273 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range8 temp___expr_277)))

;; get__post_axiom
  (assert
  (forall ((container1 us_rep))
  (forall ((position Int))
  (! (=>
     (and (dynamic_invariant5 position true true true true)
     (and (<= 1 position) (<= position (last container1))))
     (dynamic_invariant6 (get container1 position) true false true true)) :pattern (
  (get container1 position)) ))))

(assert
;; defqtvc
 ;; File "a-cofove.ads", line 734, characters 0-0
  (not
  (forall ((o Int))
  (=> (dynamic_invariant2 item true false true true)
  (=> (dynamic_invariant1 index true false true true)
  (=>
  (let ((o1 container))
  (let ((o2 (last_index o1)))
  (and
  (and (dynamic_invariant o2 true false true true) (= o2 (last (model1 o1))))
  (ite (<= index o2) (= o index)
  (let ((o3 container))
  (let ((o4 (last_index o3)))
  (and
  (and (dynamic_invariant o4 true false true true) (= o4 (last (model1 o3))))
  (and (= o o4) (in_range5 o4)))))))))
  (let ((o1 container))
  (let ((o2 (model1 o1))) (=> (= (length o2) (length1 o1)) (<= o (last o2)))))))))))
(check-sat)
(exit)
