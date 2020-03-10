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

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

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

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((sequence__ref 0))
(((sequence__refqtmk (sequence__content us_rep)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep 
  (sequence__content a))

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(define-fun length1 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun last ((container us_rep)) Int (+ 0 (length container)))

(declare-fun last__function_guard (Int us_rep) Bool)

(declare-fun get (us_rep Int) Int)

(declare-fun get__function_guard (Int us_rep Int) Bool)

(define-fun oeq ((left us_rep)
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

(declare-fun oeq__function_guard (Bool us_rep us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq1 a b) (oeq a b)) :pattern ((user_eq1 a b)) )))

(define-fun default_initial_assumption ((temp___expr_221 us_rep)
  (temp___skip_top_level_222 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_222 true))
                                         (= (length temp___expr_221) 0)))

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (count_type count_type) Bool)

(declare-const dummy2 count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_228 Int)
  (temp___is_init_224 Bool) (temp___skip_constant_225 Bool)
  (temp___do_toplevel_226 Bool)
  (temp___do_typ_inv_227 Bool)) Bool (=>
                                     (or (= temp___is_init_224 true)
                                     (<= 0 2147483647)) (in_range2
                                     temp___expr_228)))

;; length__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (length container)))
     (and (<= (+ 0 result) 100) (dynamic_invariant1 result true false true
     true))) :pattern ((length container)) )))

(define-fun ole ((left us_rep)
  (right us_rep)) Bool (and (<= (length left) (length right)) (ite (forall
                                                                   ((n Int))
                                                                   (=>
                                                                   (and
                                                                   (<= 1 n)
                                                                   (<= n 
                                                                   (last
                                                                   left)))
                                                                   (= 
                                                                   (get left
                                                                   n) 
                                                                   (get right
                                                                   n))))
                                                              true false)))

(declare-fun ole__function_guard (Bool us_rep us_rep) Bool)

(declare-fun add (us_rep Int) us_rep)

(declare-fun add__function_guard (us_rep us_rep Int) Bool)

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= 0 (element_typeqtint i)) (<= (element_typeqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (element_type element_type) Bool)

(declare-const dummy3 element_type)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant2 ((temp___expr_206 Int)
  (temp___is_init_202 Bool) (temp___skip_constant_203 Bool)
  (temp___do_toplevel_204 Bool)
  (temp___do_typ_inv_205 Bool)) Bool (=>
                                     (or (= temp___is_init_202 true)
                                     (<= 0 2147483647)) (in_range3
                                     temp___expr_206)))

;; add__post_axiom
  (assert
  (forall ((container us_rep))
  (forall ((new_item Int))
  (! (=>
     (and (dynamic_invariant2 new_item true true true true)
     (and (< (length container) 2147483647) (< (last container) 100)))
     (let ((result (add container new_item)))
     (and
     (and (= (length result) (+ (length container) 1))
     (= (get result (last result)) new_item))
     (= (ole container result) true)))) :pattern ((add container new_item)) ))))

(declare-fun is_append (us_rep us_rep Int) Bool)

(declare-fun is_append__function_guard (Bool us_rep us_rep Int) Bool)

(define-fun olt ((left us_rep)
  (right us_rep)) Bool (and (< (length left) (length right)) (ite (forall
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

(declare-fun olt__function_guard (Bool us_rep us_rep) Bool)

;; is_append__post_axiom
  (assert true)

;; is_append__def_axiom
  (assert
  (forall ((s1 us_rep) (s2 us_rep))
  (forall ((e Int))
  (! (= (= (is_append s1 s2 e) true)
     (and (and (= (olt s1 s2) true) (= (length s1) (- (length s2) 1)))
     (= (get s2 (last s2)) e))) :pattern ((is_append s1 s2 e)) ))))

(declare-datatypes ((model_type__ref 0))
(((model_type__refqtmk (model_type__content us_rep)))))
(define-fun model_type__ref_model_type__content__projection ((a model_type__ref)) us_rep 
  (model_type__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

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

(define-fun bool_eq1 ((a (Array Int natural)) (a__first Int) (a__last Int)
  (b (Array Int natural)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_177 Int))
                           (=>
                           (and (<= a__first temp___idx_177)
                           (<= temp___idx_177 a__last))
                           (= (to_rep (select a temp___idx_177)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_177)))))))
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
  (forall ((temp___idx_177 Int))
  (=> (and (<= a__first temp___idx_177) (<= temp___idx_177 a__last))
  (= (to_rep (select a temp___idx_177)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_177)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-fun valid_model (Int Int us_rep (Array Int natural)) Bool)

(declare-fun valid_model__function_guard (Bool Int Int us_rep
  (Array Int natural)) Bool)

(define-fun min ((x Int) (y Int)) Int (ite (<= x y) x y))

(define-fun max ((x Int) (y Int)) Int (ite (<= x y) y x))

;; Min_r
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
  (assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
  (assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

(declare-sort length_range 0)

(declare-fun length_rangeqtint (length_range) Int)

;; length_range'axiom
  (assert
  (forall ((i length_range))
  (and (<= 0 (length_rangeqtint i)) (<= (length_rangeqtint i) 100))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (length_range length_range) Bool)

(declare-const dummy4 length_range)

(declare-datatypes ((length_range__ref 0))
(((length_range__refqtmk (length_range__content length_range)))))
(define-fun length_range__ref_length_range__content__projection ((a length_range__ref)) length_range 
  (length_range__content a))

(define-fun dynamic_invariant3 ((temp___expr_185 Int)
  (temp___is_init_181 Bool) (temp___skip_constant_182 Bool)
  (temp___do_toplevel_183 Bool)
  (temp___do_typ_inv_184 Bool)) Bool (=>
                                     (or (= temp___is_init_181 true)
                                     (<= 0 100)) (in_range4 temp___expr_185)))

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 1 (index_typeqtint i)) (<= (index_typeqtint i) 100))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (index_type index_type) Bool)

(declare-const dummy5 index_type)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun dynamic_invariant4 ((temp___expr_192 Int)
  (temp___is_init_188 Bool) (temp___skip_constant_189 Bool)
  (temp___do_toplevel_190 Bool)
  (temp___do_typ_inv_191 Bool)) Bool (=>
                                     (or (= temp___is_init_188 true)
                                     (<= 1 100)) (in_range5 temp___expr_192)))

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq1 a b) (oeq a b)) :pattern ((user_eq1 a b)) )))

(define-fun default_initial_assumption1 ((temp___expr_236 us_rep)
  (temp___skip_top_level_237 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_237 true))
                                         (= (length temp___expr_236) 0)))

;; valid_model__post_axiom
  (assert true)

;; valid_model__def_axiom
  (assert
  (forall ((ring_buffer__first Int) (ring_buffer__length Int))
  (forall ((ring_buffer__model us_rep))
  (forall ((ring_buffer__content (Array Int natural)))
  (! (=
     (= (valid_model ring_buffer__first ring_buffer__length
        ring_buffer__model ring_buffer__content) true)
     (and (= ring_buffer__length (length ring_buffer__model))
     (forall ((i Int))
     (=> (and (<= 1 i) (<= i 100))
     (ite (and (<= ring_buffer__first i)
          (<= i (min (- (+ ring_buffer__first ring_buffer__length) 1) 100)))
     (= (to_rep (select ring_buffer__content i)) (get ring_buffer__model
                                                 (+ (- i ring_buffer__first) 1)))
     (=>
     (and (<= 1 i)
     (<= i (- (- (+ ring_buffer__first ring_buffer__length) 1) 100)))
     (= (to_rep (select ring_buffer__content i)) (get ring_buffer__model
                                                 (+ (- (+ i 100) ring_buffer__first) 1))))))))) :pattern (
  (valid_model ring_buffer__first ring_buffer__length ring_buffer__model
  ring_buffer__content)) )))))

(declare-const e Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort tTcontentSP1 0)

(declare-fun tTcontentSP1qtint (tTcontentSP1) Int)

;; tTcontentSP1'axiom
  (assert
  (forall ((i tTcontentSP1))
  (and (<= 1 (tTcontentSP1qtint i)) (<= (tTcontentSP1qtint i) 100))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (tTcontentSP1 tTcontentSP1) Bool)

(declare-const dummy6 tTcontentSP1)

(declare-datatypes ((tTcontentSP1__ref 0))
(((tTcontentSP1__refqtmk (tTcontentSP1__content tTcontentSP1)))))
(define-fun tTcontentSP1__ref_tTcontentSP1__content__projection ((a tTcontentSP1__ref)) tTcontentSP1 
  (tTcontentSP1__content a))

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i)) (<= (extended_indexqtint i) 100))))

(define-fun in_range7 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq7 (extended_index extended_index) Bool)

(declare-const dummy7 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant5 ((temp___expr_213 Int)
  (temp___is_init_209 Bool) (temp___skip_constant_210 Bool)
  (temp___do_toplevel_211 Bool)
  (temp___do_typ_inv_212 Bool)) Bool (=>
                                     (or (= temp___is_init_209 true)
                                     (<= 0 100)) (in_range7 temp___expr_213)))

;; get__post_axiom
  (assert
  (forall ((container us_rep))
  (forall ((position Int))
  (! (=>
     (and (dynamic_invariant5 position true true true true)
     (and (<= 1 position) (<= position (last container))))
     (dynamic_invariant2 (get container position) true false true true)) :pattern (
  (get container position)) ))))

(assert
;; defqtvc
 ;; File "ring_buffer.ads", line 37, characters 0-0
  (not
  (forall ((model1 us_rep) (length2 Int) (content (Array Int natural))
  (first Int))
  (=> (dynamic_invariant4 first true false true true)
  (=> (dynamic_invariant3 length2 true false true true)
  (=> (dynamic_invariant e true false true true)
  (=>
  (forall ((model2 us_rep) (length3 Int) (content1 (Array Int natural))
  (first1 Int)) (valid_model__function_guard
  (valid_model first1 length3 model2 content1) first1 length3 model2
  content1))
  (=> (= (valid_model first length2 model1 content) true)
  (=> (< (length model1) 100)
  (let ((o e))
  (let ((o1 (add model1 o)))
  (=>
  (and (and (= (length o1) (+ (length model1) 1)) (= (get o1 (last o1)) o))
  (= (ole model1 o1) true))
  (forall ((model2 us_rep))
  (=> (= model2 o1)
  (forall ((content1 (Array Int natural)))
  (=>
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (<= first (- 100 length2)) true false))
  (ite (= spark__branch true)
  (exists ((o2 natural))
  (and (= (to_rep o2) e)
  (let ((temp___313 (+ first length2)))
  (and (and (<= 1 temp___313) (<= temp___313 100))
  (= content1 (store content temp___313 o2))))))
  (exists ((o2 natural))
  (and (= (to_rep o2) e)
  (let ((temp___314 (+ (- length2 100) first)))
  (and (and (<= 1 temp___314) (<= temp___314 100))
  (= content1 (store content temp___314 o2))))))))) (in_range4
  (+ length2 1))))))))))))))))))
(check-sat)
(exit)
